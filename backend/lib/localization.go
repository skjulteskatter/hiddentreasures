package lib

type LocaleMap[T any] map[string]T

type LocaleString LocaleMap[string]

type LocaleValue[T any] struct {
	Language string
	Value    T
}

var defaults = []string{"en", "no"}

func (m LocaleMap[T]) GetOrNil(languages []string) *LocaleValue[T] {
	languages = append(languages, defaults...)
	for _, language := range languages {
		v, ok := m[language]
		if ok {
			return &LocaleValue[T]{
				Language: language,
				Value:    v,
			}
		}
	}
	return nil
}

func (m LocaleMap[T]) GetValue(languages []string) T {
	return m.Get(languages).Value
}

func (m LocaleMap[T]) Get(languages []string) LocaleValue[T] {
	v := m.GetOrNil(languages)
	if v == nil {
		v = &LocaleValue[T]{}
	}
	return *v
}
