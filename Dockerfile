FROM golang:1.11 as builder

WORKDIR /go/src/github.com/aaronflower/dzone-shipping/consignment-cli

COPY . .

# RUN go get -u github.com/golang/dep/cmd/dep
# RUN dep init && dep ensure
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

FROM alpine:latest

RUN apk --no-cache add ca-certificates

RUN mkdir /app
WORKDIR /app
COPY consignment.json /app/consignment.json
# COPY --from=builder /go/src/github.com/aaronflower/dzone-shipping/service.vessel .
COPY ./consignment-cli .

# Run the binary as per usual! This time with a binary build in a separate container,
# with all of the correct dependencies and runtime libraries.
CMD ["./consignment-cli", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VyIjp7ImlkIjoiMDc0OTVkN2EtMGE3OS00ZGM3LThjNjEtZjYwOTdhZWYxMTI3IiwibmFtZSI6IkFhcm9uIEZsb3dlciIsImNvbXBhbnkiOiJiYmMiLCJlbWFpbCI6ImFhcm9uZmxvd2VyQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJhJDEwJFVvSi9HMnJyd055S01lbTFDd1dWcXVham1nL2Jlc3Frd1FhUjA1cUdmeHByWlR2c0d2MmN1In0sImV4cCI6MTU0NTUzNjA4NSwiaXNzIjoiZ28ubWljcm8uc3J2LnVzZXIifQ.aAj74mUmVoZH4cf3ywe5R3xUpVoPVY6xmG4DrbVgdg0"]
# eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VyIjp7ImlkIjoiMDc0OTVkN2EtMGE3OS00ZGM3LThjNjEtZjYwOTdhZWYxMTI3IiwibmFtZSI6IkFhcm9uIEZsb3dlciIsImNvbXBhbnkiOiJiYmMiLCJlbWFpbCI6ImFhcm9uZmxvd2VyQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJhJDEwJFVvSi9HMnJyd055S01lbTFDd1dWcXVham1nL2Jlc3Frd1FhUjA1cUdmeHByWlR2c0d2MmN1In0sImV4cCI6MTU0NTUzNjA4NSwiaXNzIjoiZ28ubWljcm8uc3J2LnVzZXIifQ.aAj74mUmVoZH4cf3ywe5R3xUpVoPVY6xmG4DrbVgdg0
