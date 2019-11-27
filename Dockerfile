FROM scratch
EXPOSE 8080
ENTRYPOINT ["/devops-world-skaffold01"]
COPY ./bin/ /