package sheets

import (
	"bytes"
	"encoding/json"
	"github.com/ansel1/merry/v2"
	"github.com/google/uuid"
	"io"
	"net/http"
)

type SheetDetails struct {
	ID          uuid.UUID
	Title       string
	Instruments []string
}

type RenderOptions struct {
	ID              uuid.UUID
	Transposition   int
	Clef            string
	Zoom            int
	Width           int
	ImageFormat     string
	Instruments     []string
	DrawPartNames   bool
	OptimizeSVGSize bool
	GuitarChords    string
	PageFormat      string
}

type Client struct {
	secret  string
	address string
}

func NewClient(secret string, address string) *Client {
	return &Client{
		secret:  secret,
		address: address,
	}
}

func (c *Client) Render(options RenderOptions) ([]string, error) {
	serialized, err := json.Marshal(options)
	if err != nil {
		return nil, err
	}
	req, err := http.NewRequest(http.MethodPost, c.address+"/sheetmusic/", bytes.NewReader(serialized))
	if err != nil {
		return nil, err
	}
	resp, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, err
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	if resp.StatusCode < 200 || resp.StatusCode > 299 {
		return nil, merry.Sentinel("Error code", merry.WithHTTPCode(resp.StatusCode), merry.WithMessage(string(body)))
	}
	var result []string
	err = json.Unmarshal(body, &result)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (c *Client) RetrieveInfo(id uuid.UUID) SheetDetails {
	return SheetDetails{}
}
