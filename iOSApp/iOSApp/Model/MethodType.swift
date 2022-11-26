import Foundation

public protocol AnimatableView {
    associatedtype Input

    var input: Input { get }

    init(input: Input)
}

public protocol MethodType {
}

public struct AnimationMethodType: MethodType {
    var animatableView: any AnimatableView
}

public struct MarkdownMethodType: MethodType {
    public let input: URL
}
