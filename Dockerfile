FROM golang:alpine3.10 as base
WORKDIR /app
ADD *.go .
RUN go build -ldflags "-s -w" -o app.bin
RUN apk add upx
RUN upx --ultra-brute app.bin 
#https://linux.die.net/man/1/upx
CMD [ "./app.bin"]

FROM scratch
COPY --from=base /app/app.bin .
CMD [ "./app.bin"]