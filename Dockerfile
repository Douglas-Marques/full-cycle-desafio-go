FROM golang:1.16 as build
WORKDIR /go/src
COPY . .
ENV PATH="/go/bin:${PATH}"
RUN GOOS=linux GOARCH=386 go build -ldflags="-s -w" index.go

FROM scratch
WORKDIR /app
COPY . .
COPY --from=build /go/src/index .
CMD ["./index"]
