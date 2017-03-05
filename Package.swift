import PackageDescription

let package = Package(
    name: "MoyaUnbox",
    targets: [
        Target(name: "MoyaUnbox"),
        Target(name: "RxMoyaUnbox", dependencies: ["MoyaUnbox"]),
        Target(name: "ReactiveMoyaUnbox", dependencies: ["MoyaUnbox"])
    ],
    dependencies: [
        .Package(url: "https://github.com/Quick/Nimble.git", majorVersion: 6),
        .Package(url: "https://github.com/Quick/Quick.git", majorVersion: 1),
        .Package(url: "https://github.com/Moya/Moya", majorVersion: 8),
        .Package(url: "https://github.com/johnsundell/unbox.git", majorVersion: 2)
    ],
    exclude: [
        "Carthage",
        "Configs",
        "Demo",
        "scripts"
    ]
)
