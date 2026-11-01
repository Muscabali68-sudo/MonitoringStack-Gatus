FROM golang:alpine3.24 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o gatus .


FROM gcr.io/distroless/static-debian13:nonroot

COPY --from=builder /app/gatus .
COPY --from=builder /app/config.yaml ./config/config.yaml

ENV GATUS_CONFIG_PATH=/config/config.yaml

EXPOSE 8080

ENTRYPOINT ["/gatus"]