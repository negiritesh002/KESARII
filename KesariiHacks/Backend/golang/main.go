package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/rs/cors"
	"main.go/golang/controllers"
)

func main() {
	r := mux.NewRouter()
	handler := cors.Default().Handler(r)
	r.HandleFunc("/signup", controllers.Signup).Methods("POST")
	r.HandleFunc("/signin", controllers.Signin).Methods("POST")

	//google router
	r.HandleFunc("/googleLogin", controllers.GoogleLogin).Methods("GET")
	r.HandleFunc("/auth/google/callback", controllers.GoogleCallback).Methods("GET")
	fmt.Println("Server is getting ready...")
	log.Fatal(http.ListenAndServe(":8000", handler))
}
