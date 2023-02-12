package database

import (
	"context"
	sanity "github.com/sanity-io/client-go"
	"github.com/skjulteskatter/hiddentreasures/backend/models"
)

type Client struct {
	client *sanity.Client
}

func New(projectID string, token string) (*Client, error) {
	client, err := sanity.New(projectID, sanity.WithToken(token))
	if err != nil {
		return nil, err
	}
	return &Client{
		client: client,
	}, nil
}

func getResult[T any](ctx context.Context, client *sanity.Client, query string) (T, error) {
	var result T
	resp, err := client.Query(query).Do(ctx)
	if err != nil {
		return result, err
	}
	err = resp.Unmarshal(&result)
	return result, err
}

func (c *Client) GetSongs(ctx context.Context) ([]models.Song, error) {
	_, err := getResult(ctx, c.client, "*[_type == 'song']")
	if err != nil {
		return nil, err
	}
	return nil, nil
}
