import ProjectDescription

let project = Project(
    name: "MultiViewIssue",
    targets: [
        .target(
            name: "MultiViewIssue",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.MultiViewIssue",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["MultiViewIssue/Sources/**"],
            resources: ["MultiViewIssue/Resources/**"],
            dependencies: [
                .external(name: "Engine")
            ]
        ),
        .target(
            name: "MultiViewIssueTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MultiViewIssueTests",
            infoPlist: .default,
            sources: ["MultiViewIssue/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MultiViewIssue")]
        ),
    ]
)
