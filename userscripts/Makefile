.DEFAULT_GOAL := help

.PHONY: help
help: #   Show help information.
	@grep -E "^[a-z-]+: #" $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ": # "}; {printf "%s: %s\n", $$1, $$2}'

.PHONY: compile
build: #  C
	@./node_modules/.bin/tsc \
		--target esnext \
		--outDir dist src/*.ts
	@cp -r src/*.css dist
