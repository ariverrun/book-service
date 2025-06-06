FROM golang:1.24 AS build-stage

WORKDIR /app

# COPY go.mod go.sum ./
# RUN go mod download

COPY src/go.mod ./
RUN go mod download

COPY src/*.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /book-service-app

FROM build-stage AS run-test-stage
RUN go test -v ./...

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /book-service-app /book-service-app

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/book-service-app"]