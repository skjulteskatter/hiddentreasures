# Build step
FROM golang:alpine AS build

WORKDIR /build

COPY ./go.* ./

RUN go mod download

COPY ./backend /build/backend

RUN CGOENABLED=0 go build -o /app ./backend/cmd/api

# Runtime image
FROM gcr.io/distroless/static AS runtime

COPY --from=build /app /app

CMD ["/app"]