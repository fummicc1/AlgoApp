import Foundation

public struct MarkdownAddMethod: Method {

    public var id: MethodID = .add

    public var type: any MethodType = MarkdownMethodType (
        input: URL(
            string: "https://raw.githubusercontent.com/fummicc1/AlgoApp/main/README.md"
        )!
    )

    public var name: String = "足し算"
}
