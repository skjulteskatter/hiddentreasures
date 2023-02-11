package database

import (
	_ "embed"
	"encoding/json"
	"github.com/go-playground/assert/v2"
	"log"
	"testing"
)

//go:embed testdata/blockdata.json
var blockdata string

func TestToMarkdown(t *testing.T) {
	var data struct {
		Input  BlockContent
		Output string
	}

	_ = json.Unmarshal([]byte(blockdata), &data)

	log.Print(data.Input.ToMarkdown())
	log.Print(data.Output)

	assert.Equal(t, data.Output, data.Input.ToMarkdown())
}
