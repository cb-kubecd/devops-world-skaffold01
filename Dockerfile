FROM golang:1.12.9-alpine3.10 as builder
COPY main.go /app/
WORKDIR /app/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /devops-world-skaffold01

FROM scratch
EXPOSE 8080
EXPOSE 8081
COPY --from=builder /devops-world-skaffold01 .
ENTRYPOINT ["/devops-world-skaffold01"]
