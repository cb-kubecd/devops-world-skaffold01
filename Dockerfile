FROM golang:1.12.9-alpine3.10 as builder
COPY main.go /app/
WORKDIR /app/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /devops-world-skaffold01

FROM scratch
EXPOSE 8080
COPY --from=builder /app .
ENTRYPOINT ["/devops-world-skaffold01"]
