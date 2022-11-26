import Foundation
import SwiftUI

public protocol Method: Identifiable, Hashable {
    var id: MethodID { get }
    var name: String { get }
    var type: any MethodType { get }
}

extension Method where Self: Identifiable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension Method where Self: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

