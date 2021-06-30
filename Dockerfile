#FROM golang:1.14.2-alpine AS build
FROM golang:1.16
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
COPY --from=build /go/app /bin/
EXPOSE 8080
CMD ["app"]
