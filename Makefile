all: trust

trust: cmd/trust/*.go pkg/trust/*.go pkg/printdirtree/*.go
	go build -buildvcs=auto -o trust ./cmd/trust/

clean:
	rm -f trust

.PHONY: test
test: trust
	bats tests/keyset.bats
	bats tests/project.bats
	bats tests/sudi.bats
