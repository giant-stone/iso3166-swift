ISO3166_REPO_DIR ?= ../iso3166
SWIFT_GEN_DIR ?= $(ISO3166_REPO_DIR)/gen/swift
SOURCES_DIR ?= Sources/Iso3166
REQUIRED_GEN_FILES := iso3166extended.swift iso4217.swift Iso3166.swift

.PHONY: all generate build test clean

all: generate

generate:
	@test -d "$(SOURCES_DIR)" || (echo "Missing directory: $(SOURCES_DIR)" && exit 1)
	@test -d "$(SWIFT_GEN_DIR)" || (echo "Missing generated source directory: $(SWIFT_GEN_DIR)" && echo "Set ISO3166_REPO_DIR=/path/to/iso3166" && exit 1)
	@for file in $(REQUIRED_GEN_FILES); do \
		test -f "$(SWIFT_GEN_DIR)/$$file" || (echo "Missing generated file: $(SWIFT_GEN_DIR)/$$file" && exit 1); \
	done
	cp "$(SWIFT_GEN_DIR)"/*.swift "$(SOURCES_DIR)/"
	@echo "Copied generated sources from $(SWIFT_GEN_DIR)"

build:
	swift build --build-tests

test:
	swift test --parallel

clean:
	swift package clean
