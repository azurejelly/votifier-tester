FROM golang:1.23.2 AS build

WORKDIR /build

COPY . .

RUN CGO_ENABLED=0 go build -o /build/votifier-tester

FROM gcr.io/distroless/static-debian12

WORKDIR /app

COPY --from=build /build/votifier-tester .

ENTRYPOINT [ "./votifier-tester" ]