import Foundation

public struct Problem: Identifiable, Hashable {

    public static func ==(lhs: Problem, rhs: Problem) -> Bool {
        lhs.id == rhs.id
    }

    public var id: String
    public var title: String
    public var webUrl: URL

    public var methods: [MethodID: any Method] = [:]

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
