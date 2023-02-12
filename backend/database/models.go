package database

import "github.com/google/uuid"

type Reference struct {
	Ref uuid.UUID `json:"_ref"`
}

type LocaleString []struct {
}

type Song struct {
	Collections []struct {
		Collection Reference
		Number     int
	}
	Copyrights []struct {
		Type      string
		Copyright Reference
	}
	Details []struct {
		Content  BlockContent
		Language Reference
	}
}
