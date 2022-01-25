FROM golang:1.14.0-alpine as builder
WORKDIR /app
COPY app.go .
RUN go build -o app -a -ldflags='-w -s -extldflags "-static"' . 


FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["./app"]


