// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "CloudtipsSDK",

    platforms: [
        .iOS(.v12)
    ],

    products: [
        .library(name: "CloudtipsSDK", targets: ["CloudtipsSDKTarget"]),
    ],

    dependencies: [
        //.package(url: "https://github.com/amplitude/Amplitude-iOS.git", from: "8.8.0"),
        //.package(url: "https://github.com/amplitude/analytics-connector-ios.git", from: "1.0.0")
    ],

    targets: [

        .target(
            name: "CloudtipsSDKTarget",
            dependencies: [
                .target(name: "CloudtipsSDK"),
                .target(name: "YandexPaySDK"),
                .target(name: "Amplitude"),
                .target(name: "AnalyticsConnector"),
            ],
            path: "PackageWrapper"
        ),

        .binaryTarget(name: "CloudtipsSDK", path: "Frameworks/CloudtipsSDK.xcframework"),
        .binaryTarget(name: "Amplitude", path: "Frameworks/Amplitude.xcframework"),
        .binaryTarget(name: "AnalyticsConnector", path: "Frameworks/AnalyticsConnector.xcframework"),
        .binaryTarget(name: "YandexPaySDK",
                      url: "https://yandexpay-ios-sdk.s3.yandex.net/1.2.1/YandexPaySDK_121222_7524285.xcframework.zip",
                      checksum: "714698b6e5ff407a76304ce8cf7801fcfc143e432157a1c6624abb04c51bfc2e"),
        // .binaryTarget(name: "YandexPaySDK", path: "Frameworks/YandexPaySDK.xcframework"),
    ]
)
