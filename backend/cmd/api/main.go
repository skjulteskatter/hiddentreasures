package main

import (
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/gin-gonic/gin"
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
	r := gin.Default()
	r.POST("/query", graphHandler())

	err := r.Run(":8080")
	if err != nil {
		panic(err)
	}
}
