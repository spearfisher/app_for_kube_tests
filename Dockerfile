# STEP 1 build executable binary
FROM golang:alpine as builder
RUN apk add git
COPY . $GOPATH/src/github.com/spearfisher/app_for_kube_tests
WORKDIR $GOPATH/src/github.com/spearfisher/app_for_kube_tests

#get dependancies
RUN go get -d -v
#build the binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/main

# STEP 2 build a small image
# start from scratch
FROM scratch
# Copy our static executable
COPY --from=builder /go/bin/main app
EXPOSE 3333
CMD ["/app"]