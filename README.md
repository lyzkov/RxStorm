# RxStorm

## Example

To run the example project, open Example directory.

## Requirements

## Installation

### Swift Package Manager

Just add this repo URL as a package dependency.

```
// swift-tools-version:5.2

import PackageDescription

let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/lyzkov/RxStorm.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "Your target",
            dependencies: ["RxStorm"]),
        )
    ],
    ...
)
```

### Cocoapods

RxStorm is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'RxStorm'
```

## Author

lyzkov, lyzkov@gmail.com

## License

RxStorm is available under the MIT license. See the LICENSE file for more info.
