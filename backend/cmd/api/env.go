package main

import (
	firebase "firebase.google.com/go"
	"os"
)

type envConfig struct {
	Firebase firebase.Config
}

func getEnvConfig() envConfig {
	return envConfig{
		Firebase: firebase.Config{
			ProjectID: os.Getenv("FIREBASE_PROJECT_ID"),
		},
	}
}
