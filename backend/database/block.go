package database

import (
	"github.com/samber/lo"
	"strings"
)

type Block struct {
	Type     string   `json:"_type"`
	Key      string   `json:"_key"`
	Style    string   `json:"style"`
	MarkDefs []string `json:"markDefs"`
	Children []Child  `json:"children"`
}

type Child struct {
	Key   string   `json:"_key"`
	Type  string   `json:"_type"`
	Marks []string `json:"marks"`
	Text  string   `json:"text"`
}

type BlockContent []Block

func (bc BlockContent) ToMarkdown() string {
	md := ""
	for index, b := range bc {
		if index != 0 {
			md += "\n"
		}

		switch b.Style {
		case "blockquote":
			md += "> "
		}

		for _, c := range b.Children {
			styles := lo.Uniq(append(b.MarkDefs, c.Marks...))
			tags := strings.Join(lo.Map(styles, func(i string, _ int) string {
				switch i {
				case "em":
					return "*"
				case "b":
					return "**"
				default:
					return ""
				}
			}), "")
			md += tags + c.Text + tags
		}
	}
	return md
}
