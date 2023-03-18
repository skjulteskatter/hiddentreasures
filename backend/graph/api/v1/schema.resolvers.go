package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/generated"
	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/model"
)

// Song is the resolver for the song field.
func (r *queryRootResolver) Song(ctx context.Context, id string) (*model.Song, error) {
	panic(fmt.Errorf("not implemented: Song - song"))
}

// Sheet is the resolver for the sheet field.
func (r *queryRootResolver) Sheet(ctx context.Context, id string) (*model.Sheet, error) {
	panic(fmt.Errorf("not implemented: Sheet - sheet"))
}

// Article is the resolver for the article field.
func (r *queryRootResolver) Article(ctx context.Context, id string) (*model.Article, error) {
	panic(fmt.Errorf("not implemented: Article - article"))
}

// QueryRoot returns generated.QueryRootResolver implementation.
func (r *Resolver) QueryRoot() generated.QueryRootResolver { return &queryRootResolver{r} }

type queryRootResolver struct{ *Resolver }
