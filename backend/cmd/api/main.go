package main

import (
	"context"
	firebase "firebase.google.com/go"
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/gin-gonic/gin"
	"github.com/skjulteskatter/hiddentreasures/backend/auth"
	graph "github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1"
	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/generated"
)

func graphHandler() gin.HandlerFunc {
	resolver := graph.Resolver{}

	h := handler.NewDefaultServer(generated.NewExecutableSchema(generated.Config{Resolvers: &resolver}))

	return func(ctx *gin.Context) {
		h.ServeHTTP(ctx.Writer, ctx.Request)
	}
}

func main() {
	ctx := context.Background()

	config := getEnvConfig()

	firebaseApp, err := firebase.NewApp(ctx, &config.Firebase)

	if err != nil {
		panic(err)
	}

	r := gin.Default()
	r.Use(auth.VerifyUserMiddleware(firebaseApp))
	r.POST("/query", graphHandler())

	err = r.Run(":7192")
	if err != nil {
		panic(err)
	}
}
