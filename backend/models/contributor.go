package models

import (
	"github.com/google/uuid"
	"github.com/guregu/null"
)

type Contributor struct {
	ID          uuid.UUID
	DisplayName string
	Subtitle    null.String
	Image       null.String
	Slug        null.String

	BirthYear null.Int
	Country   null.String
}
