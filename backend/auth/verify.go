package auth

import (
	firebase "firebase.google.com/go"
	"github.com/gin-gonic/gin"
	"github.com/skjulteskatter/hiddentreasures/backend/models"
	"strings"
)

const (
	CtxUserID = "user_id"
	CtxUser   = "user"
)

func VerifyUserMiddleware(app *firebase.App) gin.HandlerFunc {
	return func(ctx *gin.Context) {
		auth, err := app.Auth(ctx)
		if err != nil {
			ctx.AbortWithStatusJSON(500, gin.H{"error": err.Error()})
			return
		}

		user := &models.User{
			Anonymous: true,
		}

		authHeader := ctx.GetHeader("Authorization")
		parts := strings.Split(authHeader, " ")
		if len(parts) == 2 {
			token, err := auth.VerifyIDToken(ctx, parts[1])
			if err != nil {
				ctx.AbortWithStatusJSON(401, gin.H{"error": err.Error()})
				return
			}
			ctx.Set(CtxUserID, token.UID)
			user.ID = token.UID
			user.Anonymous = false
			if name, ok := token.Claims["name"].(string); ok {
				user.DisplayName = name
			}
			if email, ok := token.Claims["email"].(string); ok {
				user.Email = email
			}
			if emailVerified, ok := token.Claims["email_verified"].(bool); ok {
				user.EmailVerified = emailVerified
			}
		}
		ctx.Set(CtxUser, user)
	}
}
