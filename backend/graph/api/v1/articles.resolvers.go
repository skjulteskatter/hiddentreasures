package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/generated"
	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/model"
)

// Content is the resolver for the content field.
func (r *articleResolver) Content(ctx context.Context, obj *model.Article) (*model.LocalizedString, error) {
	panic(fmt.Errorf("not implemented: Content - content"))
}

// Article returns generated.ArticleResolver implementation.
func (r *Resolver) Article() generated.ArticleResolver { return &articleResolver{r} }

type articleResolver struct{ *Resolver }
