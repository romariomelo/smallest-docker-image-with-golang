FROM golang:1.22.0 as builder

WORKDIR /go

COPY main.go .

RUN go build ./main.go

FROM scratch

COPY --from=builder /go/main .

CMD [ "./main" ]