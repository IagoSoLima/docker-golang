FROM golang:1.16-alpine AS build

WORKDIR /go/src/app

COPY . .

RUN go build -o /app main.go

FROM scratch

COPY --from=build /app /app
 
CMD ["/app"]
