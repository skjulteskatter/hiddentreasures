package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/generated"
	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/model"
)

// Participants is the resolver for the participants field.
func (r *songResolver) Participants(ctx context.Context, obj *model.Song) ([]*model.Participant, error) {
	panic(fmt.Errorf("not implemented: Participants - participants"))
}

// Song returns generated.SongResolver implementation.
func (r *Resolver) Song() generated.SongResolver { return &songResolver{r} }

type songResolver struct{ *Resolver }
