package controllers

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"regexp"
	"strconv"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/joho/godotenv"
	"go.mongodb.org/mongo-driver/bson"
	"golang.org/x/crypto/bcrypt"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/google"
	"main.go/golang/database"
	"main.go/golang/models"
)

type Claims struct {
	Email string `bson:"email"`
	jwt.StandardClaims
}

type User struct {
    Name  string `json:"name"`
    Email string `json:"email"`
	jwt.StandardClaims
}


type Response struct {
	Firstname string    `bson:"firstname"`
	Email     string    `bson:"email"`
	LoginTime time.Time `bson:"logintime"`
	Token     string    `bson:"token"`
}

type TokenInfo struct {
    Iss           string `json:"iss"`
    Sub           string `json:"sub"`
    Aud           string `json:"aud"`
    Exp           string `json:"exp"`
    Email         string `json:"email"`
    EmailVerified string `json:"email_verified"`
    Name          string `json:"name"`
    Picture       string `json:"picture"`
}

var jwtKey = []byte(os.Getenv("JWT_SECRET_KEY"))

var googleOauthConfig *oauth2.Config
var oauthStateString2 string

func init() {
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Error loading .env file: %v", err)
	}

	//google configuration
	googleOauthConfig = &oauth2.Config{
		ClientID:     os.Getenv("CLIENT_ID"),
		ClientSecret: os.Getenv("CLIENT_SECRET"),
		RedirectURL:  os.Getenv("GOOGLE_REDIRECT_URL"),
		Scopes:       []string{"openid", "email", "profile"},
		Endpoint:     google.Endpoint,
	}
	oauthStateString2 = os.Getenv("OAUTH_STRING_2")

}

// function to check numeric value
func containsNumericValue(firstname string) bool {
	// Regex pattern to check for numeric values
	re := regexp.MustCompile(`[0-9]`)
	return re.MatchString(firstname)
}

// validate password function
func validatePassword(password string) bool {
	hasNumber := regexp.MustCompile(`[0-9]`).MatchString(password)
	hasUpper := regexp.MustCompile(`[A-Z]`).MatchString(password)
	hasLower := regexp.MustCompile(`[a-z]`).MatchString(password)
	hasSpecial := regexp.MustCompile(`[!@#~$%^&*()+|_.,?]`).MatchString(password)

	return hasNumber && hasUpper && hasLower && hasSpecial
}

// Function to check if a string contains only numeric values
func isNumeric(s string) bool {
	for _, char := range s {
		if char < '0' || char > '9' {
			return false
		}
	}
	return true
}

func Signup(w http.ResponseWriter, r *http.Request) {
	if database.DBcollection == nil {
		http.Error(w, "Database connection is not initialized", http.StatusInternalServerError)
		log.Fatal("MongoDB collection is not initialized")
		return
	}
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Access-Control-Allow-Methods", "POST")
	w.Header().Set("Access-Control-Allow-Headers", "Content-Type")

	// Log the incoming request
	fmt.Println("Received signup request Demo Tanuj")

	// Decode the JSON request body
	var user models.User
	if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
		http.Error(w, "Error parsing JSON: "+err.Error(), http.StatusBadRequest)
		return
	}

	//Debugger Print Statements
	fmt.Printf("User: %+v\n", user)
	fmt.Printf("Validation - FirstName: %s, MiddleName: %s, LastName: %s, NickName: %s, Mobile: %s, Emergency: %s, Email: %s\n", user.FirstName, user.MiddleName, user.LastName, user.NickName, user.MobileNumber, user.EmergencyNumber, user.Email)



	// Validation logic
	if containsNumericValue(user.FirstName) || containsNumericValue(user.MiddleName) ||
		containsNumericValue(user.LastName) || containsNumericValue(user.NickName) {
		http.Error(w, "First Name, Middle Name, Last Name, or Nick Name should not contain numeric value", http.StatusBadRequest)
		return
	}

	if user.FirstName == "" || user.MiddleName == "" || user.LastName == "" || user.NickName == "" ||
		user.MobileNumber == "" || user.EmergencyNumber == "" || user.Email == "" || user.CurrentAddress == "" || user.PermanentAddress == "" ||
		user.SocietyName == "" || user.Block == "" || user.FlatNumber == "" {
		http.Error(w, "All fields are required.", http.StatusBadRequest)
		return
	}

	if(len(user.Password) < 12 || len(user.ConfirmPassword) < 12){
		http.Error(w, "Password lenght should be greater than 12", http.StatusBadRequest)
		return
	}

	if !validatePassword(user.Password) || !validatePassword(user.ConfirmPassword) {
		http.Error(w, "Password should contain numeric values, special characters, at least one uppercase and one lowercase character", http.StatusBadRequest)
		return
	}

	if user.Password != user.ConfirmPassword {
		http.Error(w, "Password and Confirm password are not the same", http.StatusBadRequest)
		return
	}

	if !isNumeric(user.MobileNumber) || !isNumeric(user.EmergencyNumber) || !isNumeric(user.FlatNumber) {
		http.Error(w, "Mobile number, Emergency Number, or Flat Number should contain only numeric values", http.StatusBadRequest)
		return
	}

	// Check for existing email
	emailFilter := bson.M{"email": user.Email}
	var existingUser models.User
	err := database.DBcollection.FindOne(context.TODO(), emailFilter).Decode(&existingUser)
	if err == nil {
		http.Error(w, "Email already exists", http.StatusConflict)
		return
	}

	// Check for existing mobile number
	mobileFilter := bson.M{"mobilenumber": user.MobileNumber}
	err = database.DBcollection.FindOne(context.TODO(), mobileFilter).Decode(&existingUser)
	if err == nil {
		http.Error(w, "Mobile Number already exists (Tanuj's Number)", http.StatusConflict)
		return
	}

	// Hash the password
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		http.Error(w, "Server Error during Hashing", http.StatusInternalServerError)
		return
	}

	// Create the user
	user.Password = string(hashedPassword)
	if _, err := database.DBcollection.InsertOne(context.Background(), user); err != nil {
		http.Error(w, "Error inserting user into the database", http.StatusInternalServerError)
		return
	}

	// Set response header to application/json
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{
		"Status": "User registered successfully",
	})
}

func Signin(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Access-Control-Allow-Origin", "*")
	w.Header().Set("Access-Control-Allow-Methods", "POST")
	w.Header().Set("Access-Control-Allow-Headers", "Content-Type")

	// Decode the JSON request body
	var credentials struct {
		Email    string `bson:"email" json:"email"`
		Password string `bson:"password" json:"password"`
	}

	if err := json.NewDecoder(r.Body).Decode(&credentials); err != nil {
		http.Error(w, "Error parsing JSON: "+err.Error(), http.StatusBadRequest)
		return
	}


	email := credentials.Email
	password := credentials.Password

	if email == "" || password == "" {
		http.Error(w, "All fields are required", http.StatusBadRequest)
		return
	}

	var user models.User
	err := database.DBcollection.FindOne(context.TODO(), bson.M{"email": email}).Decode(&user)
	if err != nil {
		http.Error(w, "Invalid email!", http.StatusUnauthorized)
		return
	}

	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password))
	if err != nil {
		http.Error(w, "Invalid password", http.StatusUnauthorized)
		return
	}

	// Creating a JWT Token
	expirationTime := time.Now().Add(24 * time.Hour)
	claims := &Claims{
		Email: user.Email,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		http.Error(w, "Internal Server Error (Tanuj's Server)", http.StatusInternalServerError)
		return
	}

	// Set response header to application/json
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

	// Preparing Response
	response := Response{
		Firstname: user.FirstName,
		Email:     user.Email,
		Token:     tokenString,
		LoginTime: time.Now(),
	}

	json.NewEncoder(w).Encode(response)
	log.Println("Signin successful, token generated")
}


// authentication using google
// google handler
func GoogleLogin(w http.ResponseWriter, r *http.Request) {

	url := googleOauthConfig.AuthCodeURL(oauthStateString2)
	http.Redirect(w, r, url, http.StatusTemporaryRedirect)
}

func GoogleCallback(w http.ResponseWriter, r *http.Request) {
	code := r.URL.Query().Get("code")
	token, err := googleOauthConfig.Exchange(context.Background(), code)
	if err != nil {
		log.Fatalf("Code exchange failed: %s", err)
		return
	}
	accessToken := token.AccessToken
	refreshToken := token.RefreshToken
	idToken := token.Extra("id_token").(string)
	//print id token
	// fmt.Fprintf(w, "ID Token: %s\n", idToken)
	
	tokenInfo, err := verifyGoogleIDToken(idToken)
    if err != nil {
        fmt.Printf("Error verifying ID token: %v\n", err)
        return
    }

    // Print out the token information
    fmt.Printf("Token Info:\nIssuer: %s\nSubject: %s\nEmail: %s\nName: %s\n",
        tokenInfo.Iss, tokenInfo.Sub, tokenInfo.Email, tokenInfo.Name)
	
		//Returning the token
		w.Header().Set("Context-Type", "application/x-www-form-urlencoded")
		w.WriteHeader(http.StatusOK)
	
		// Verify email is verified
		if tokenInfo.EmailVerified != "true" {
			fmt.Println("email not verified")
			return
		}

		var resToken *oauth2.Token = &oauth2.Token{
			AccessToken:  accessToken,
			TokenType:    "Bearer",
			RefreshToken: refreshToken,
			Expiry:       time.Now().Add(time.Hour * 72),
		}
		
		// Return the OAuth2 token information to the frontend
		response := map[string]interface{}{
			"token": resToken,
			"email":  tokenInfo.Email,
			"LoginTime": time.Now(),
			"Name": tokenInfo.Name,
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
		log.Println("Signin successful, token generated")
		http.Redirect(w, r, "/", http.StatusAccepted)

}

func verifyGoogleIDToken(idToken string) (*TokenInfo, error) {
	url := fmt.Sprintf("https://oauth2.googleapis.com/tokeninfo?id_token=%s", idToken)

    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    if resp.StatusCode != http.StatusOK {
        return nil, fmt.Errorf("failed to verify token, status code: %d", resp.StatusCode)
    }

    var tokenInfo TokenInfo
    if err := json.NewDecoder(resp.Body).Decode(&tokenInfo); err != nil {
        return nil, err
    }

    // Convert Exp from string to int64
    exp, err := strconv.ParseInt(tokenInfo.Exp, 10, 64)
    if err != nil {
        return nil, fmt.Errorf("failed to convert exp to int64: %v", err)
    }

    // You can now use `exp` as an int64, for example:
    fmt.Printf("Token expiration time: %d\n", exp)

    return &tokenInfo, nil
}
