package lib

import "context"

type Restricted[T any] struct {
	Value T
}

func (r Restricted[T]) Visible(ctx context.Context) bool {
	return true
}
