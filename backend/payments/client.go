package payments

import (
	"github.com/stripe/stripe-go/v74"
	"github.com/stripe/stripe-go/v74/client"
	"net/http"
)

type Options struct {
	APIKey string
}

type Client struct {
	apiKey string
}

func New(options Options) *Client {
	return &Client{
		apiKey: options.APIKey,
	}
}

func (c *Client) ListProducts() []*stripe.Product {
	httpClient := &http.Client{}

	sc := client.New(c.apiKey, stripe.NewBackends(httpClient))

	it := sc.Products.List(&stripe.ProductListParams{})

	var products []*stripe.Product

	for it.Next() {
		for _, i := range it.ProductList().Data {
			products = append(products, i)
		}
	}

	return products
}
