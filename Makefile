VERSION=0.0.3
LDFLAGS=-ldflags "-w -s -X main.version=${VERSION}"
all: mackerel-plugin-resolver-synthetic

.PHONY: mackerel-plugin-resolver-synthetic

mackerel-plugin-resolver-synthetic: cmd/mackerel-plugin-resolver-synthetic/main.go
	go build $(LDFLAGS) -o mackerel-plugin-resolver-synthetic cmd/mackerel-plugin-resolver-synthetic/main.go

linux: cmd/mackerel-plugin-resolver-synthetic/main.go
	GOOS=linux GOARCH=amd64 go build $(LDFLAGS) -o mackerel-plugin-resolver-synthetic cmd/mackerel-plugin-resolver-synthetic/main.go

fmt:
	go fmt ./...

check:
	go test ./...

clean:
	rm -rf mackerel-plugin-resolver-synthetic

tag:
	git tag v${VERSION}
	git push origin v${VERSION}
	git push origin main
