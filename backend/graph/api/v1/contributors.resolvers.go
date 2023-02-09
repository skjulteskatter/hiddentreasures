package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/generated"
	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/model"
)

// Biography is the resolver for the biography field.
func (r *contributorResolver) Biography(ctx context.Context, obj *model.Contributor) (*model.LocalizedString, error) {
	panic(fmt.Errorf("not implemented: Biography - biography"))
}

// Contributor is the resolver for the contributor field.
func (r *participantResolver) Contributor(ctx context.Context, obj *model.Participant) (*model.Contributor, error) {
	panic(fmt.Errorf("not implemented: Contributor - contributor"))
}

// Contributor returns generated.ContributorResolver implementation.
func (r *Resolver) Contributor() generated.ContributorResolver { return &contributorResolver{r} }

// Participant returns generated.ParticipantResolver implementation.
func (r *Resolver) Participant() generated.ParticipantResolver { return &participantResolver{r} }

type contributorResolver struct{ *Resolver }
type participantResolver struct{ *Resolver }
