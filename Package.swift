// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CommunicatorFramework = "13.0.0"
    static let CoreUtilities = "6.0.0"
    static let JOSESwift = "3.0.0"
    static let HcePaymentSdk = "2.0.0"
    static let HceSdk = "2.0.0"
    static let ApduCardSdk = "0.0.28"
    static let SecureStorage = "10.0.0"
}

private class Checksums {
    static let CommunicatorFramework = "5642be4cd178fa3945a9cd3492647016fef1bc3a1ce7d8595c21f8849c33ebc8"
    static let CoreUtilities = "a18fd8596403f290884b86bc8941f13b9eb06f960d67c9ebfd3e50d5d91b4ffc"
    static let JOSESwift = "f23c30ed15df37820b6674b4b0141312f10cfbcfe48fc123d5adc345d4460902"
    static let HcePaymentSdk = "bed17d592f808429216c23fcd05b84ae389089bf897b24631201cb3702c5e7e8"
    static let HceSdk = "5fc59c23292b2f509f00592fe1043e7d325de333486050fc1c919af121dc4884"
    static let ApduCardSdk = "2e2ebb5f3e53957d4d7ec3fbe388b40bd8f4ba8ff3317bff4311dd758d6df02c"
    static let SecureStorage = "6a705def6060b412aafc1b11e759a75027a064f104ade855b1d29d0ca5fd56b4"
}

let nexusUrl = "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec"

let package = Package(
    name: "HCESDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "HCESDK",
            targets: [
                "HCESDK",
                "CommunicatorFramework",
                "CoreUtilities",
                "JOSESwift",
                "HCE_SDK",
                "HCE_PAYMENT_SDK",
                "apducard",
                "SecureStorage",
            ]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "CommunicatorFramework", url: assembleUrl("utils", "CommunicatorFramework", Versions.CommunicatorFramework), checksum: Checksums.CommunicatorFramework),
        .binaryTarget(name: "CoreUtilities", url: assembleUrl("utils", "CoreUtilities", Versions.CoreUtilities), checksum: Checksums.CoreUtilities),
        .binaryTarget(name: "apducard", url: assembleUrl("hce", "apducard", Versions.ApduCardSdk), checksum: Checksums.ApduCardSdk),
        .binaryTarget(name: "HCE_SDK", url: assembleUrl("hce", "HCE_SDK", Versions.HceSdk), checksum: Checksums.HceSdk),
        .binaryTarget(name: "HCE_PAYMENT_SDK", url: assembleUrl("hce", "HCE_PAYMENT_SDK", Versions.HcePaymentSdk), checksum: Checksums.HcePaymentSdk),
        .binaryTarget(name: "JOSESwift", url: assembleUrl("utils", "JOSESwift", Versions.JOSESwift), checksum: Checksums.JOSESwift),
        .binaryTarget(name: "SecureStorage", url: assembleUrl("talsec", "SecureStorage", Versions.SecureStorage), checksum: Checksums.SecureStorage),
        .target(
            name: "HCESDK",
            dependencies: []
        ),
    ]
)

func assembleUrl(_ group: String, _ artifact: String, _ version: String) -> String {
    let url = "\(nexusUrl)/\(group)/\(artifact)/\(version)/\(artifact).xcframework.zip"
    print(url)
    return url
}
