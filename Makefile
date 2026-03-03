SWIFT_GEN_DIR ?= ../iso3166/gen/swift
SOURCES_DIR ?= Sources/Iso3166

.PHONY: all generate build test clean

all: generate

generate:
	@test -d "$(SOURCES_DIR)" || (echo "Missing directory: $(SOURCES_DIR)" && exit 1)
	@test -d "$(SWIFT_GEN_DIR)" || (echo "Missing generated source directory: $(SWIFT_GEN_DIR)" && exit 1)
	cp "$(SWIFT_GEN_DIR)"/*.swift "$(SOURCES_DIR)/"

build:
	swift build --build-tests

test:
	swift test --parallel

clean:
	swift package clean
