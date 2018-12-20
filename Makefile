build:
	GOOS=linux GOARCH=amd64 go build -o consignment-cli
	docker build -t consignment-cli .
run:
	docker run --net="host" \
		-e MICRO_REGISTRY=mdns \
		consignment-cli \

clean:
	go clean
	rm consignment-cli

