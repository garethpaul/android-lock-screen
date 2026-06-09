.PHONY: build check lint test verify

lint:
	sh -n scripts/check-baseline.sh
	scripts/check-baseline.sh

test:
	scripts/check-baseline.sh

build:
	@echo "No Android project is checked in yet; build skipped."

verify: lint test build

check: verify
