.PHONY: build check lint test verify

override ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

lint:
	sh -n $(ROOT)scripts/check-baseline.sh
	$(ROOT)scripts/check-baseline.sh

test:
	$(ROOT)tests/check-baseline-tests.sh

build:
	@echo "No Android project is checked in yet; build skipped."

verify: lint test build

check: verify
