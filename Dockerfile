FROM golang:alpine3.10 as base
WORKDIR /app
ADD *.go .
RUN go build -ldflags "-s -w" -o app.bin
CMD [ "./app.bin"]

FROM scratch
COPY --from=base /app/app.bin .
CMD [ "./app.bin"]