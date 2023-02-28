package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/generated"
	"github.com/skjulteskatter/hiddentreasures/backend/graph/api/v1/model"
)

// Render is the resolver for the render field.
func (r *sheetResolver) Render(ctx context.Context, obj *model.Sheet, options *model.SheetRenderOptions) (*model.SheetRenderResult, error) {
	panic(fmt.Errorf("not implemented: Render - render"))
}

// Details is the resolver for the details field.
func (r *songResolver) Details(ctx context.Context, obj *model.Song) (*model.LocalizedString, error) {
	panic(fmt.Errorf("not implemented: Details - details"))
}

// AudioFiles is the resolver for the audioFiles field.
func (r *songResolver) AudioFiles(ctx context.Context, obj *model.Song) ([]*model.AudioFile, error) {
	panic(fmt.Errorf("not implemented: AudioFiles - audioFiles"))
}

// Sheets is the resolver for the sheets field.
func (r *songResolver) Sheets(ctx context.Context, obj *model.Song) ([]*model.Sheet, error) {
	panic(fmt.Errorf("not implemented: Sheets - sheets"))
}

// Sheet returns generated.SheetResolver implementation.
func (r *Resolver) Sheet() generated.SheetResolver { return &sheetResolver{r} }

// Song returns generated.SongResolver implementation.
func (r *Resolver) Song() generated.SongResolver { return &songResolver{r} }

type sheetResolver struct{ *Resolver }
type songResolver struct{ *Resolver }

// !!! WARNING !!!
// The code below was going to be deleted when updating resolvers. It has been copied here so you have
// one last chance to move it out of harms way if you want. There are two reasons this happens:
//   - When renaming or deleting a resolver the old code will be put in here. You can safely delete
//     it when you're done.
//   - You have helper methods in this file. Move them out to keep these resolver files clean.
func (r *songResolver) Participants(ctx context.Context, obj *model.Song) ([]*model.Participant, error) {
	panic(fmt.Errorf("not implemented: Participants - participants"))
}
