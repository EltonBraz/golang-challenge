FROM golang:1.14.0-alpine as builder
WORKDIR /app
COPY app.go .
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
RUN CGO_ENABLED=0 go build -o app

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["./app"]


