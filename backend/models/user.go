package models

type User struct {
	ID            string `json:"id"`
	Email         string `json:"email"`
	EmailVerified bool   `json:"emailVerified"`
	Anonymous     bool   `json:"anonymous"`
	DisplayName   string `json:"displayName"`
}
