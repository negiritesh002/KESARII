package router

import (
	"github.com/gorilla/mux"
	"main.go/golang/controllers"
)

func Router() *mux.Router {
	router := mux.NewRouter()
	router.HandleFunc("/signup", controllers.Signup).Methods("POST")
	router.HandleFunc("/signin", controllers.Signin).Methods("POST")

	//google router
	router.HandleFunc("/googleLogin", controllers.GoogleLogin).Methods("GET")
	router.HandleFunc("/auth/google/callback", controllers.GoogleCallback).Methods("GET")
	return router
}