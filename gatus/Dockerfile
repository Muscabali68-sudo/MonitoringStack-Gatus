FROM golang:alpine3.24 AS builder


RUN adduser -u 1001 -D nonroot

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o gatus .


FROM scratch

COPY --from=builder /app/gatus gatus
COPY --from=builder /app/gatus gatus/config/config.yaml

USER nonroot

EXPOSE 8080

ENTRYPOINT ["/gatus"]