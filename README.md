# iso3166-swift

ISO 3166-1, ISO 3166-3, ISO 4217, and ITU-T E.164 data for Swift.

This package is built on [giant-stone/iso3166](https://github.com/giant-stone/iso3166) and distributed as a Swift Package.

## Requirements

- Swift 6.2+

## Installation

Add this package as a dependency in your `Package.swift`:

```swift
.dependencies([
    .package(url: "https://github.com/giant-stone/iso3166-swift.git", from: "2026.3.1")
])
```

Then add `Iso3166` to your target dependencies.

## Quick Start

```swift
import Iso3166

let cn = FromCode["CN"]
let hk = FromCode["HK"]
let us = FromCode["US"]

let cny = FromAlphabeticCode["CNY"]
let hkd = FromAlphabeticCode["HKD"]
let usd = FromAlphabeticCode["USD"]
```

## Public Data Maps

- `FromCode`: ISO 3166 alpha-2/alpha-4 and historical code to `Entity3166`
- `FromRegionInCN`: Chinese region name to `Entity3166`
- `FromCommonNameInAlphaNumeric`: normalized common name to `Entity3166`
- `FromAlphabeticCode`: ISO 4217 alphabetic code to `Entity4217`

## Regenerate Data

`Sources/Iso3166/iso3166extended.swift` and `Sources/Iso3166/iso4217.swift` are generated and copied from `../iso3166/gen/swift` by default.

1. Ensure you have the source repo locally (default path expected by `make generate`):
   - `../iso3166`
2. Or set an explicit path:
   - `make generate ISO3166_REPO_DIR=/absolute/path/to/iso3166`
3. Validate:
   - `swift test --parallel`

## Platforms

This package is intended for Swift Package Manager on macOS, Linux, and Windows.

## License

MPL-2.0. See [LICENSE](LICENSE).
