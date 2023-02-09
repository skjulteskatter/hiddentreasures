package models

import (
	"github.com/google/uuid"
	"github.com/guregu/null"
	"github.com/skjulteskatter/hiddentreasures/backend/lib"
)

type Song struct {
	ID          uuid.UUID
	Collections map[uuid.UUID]null.String
	Title       lib.LocaleString
	Image       null.String

	// Relations
	Participants []Relation[uuid.UUID]
	Media        []Relation[uuid.UUID]
	Copyrights   []Relation[uuid.UUID]
	Origins      []Relation[uuid.UUID]

	// Grouping
	ThemeIDs   []uuid.UUID
	GenreIDs   []uuid.UUID
	Categories []uuid.UUID

	// Metadata
	YearPublished null.Int
	YearWritten   null.Int
	YearComposed  null.Int

	OriginalKey null.String
}

type Relation[K comparable] struct {
	Type      string
	Reference K
}
