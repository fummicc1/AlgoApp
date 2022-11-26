import Foundation
import SwiftUI


extension Text {
    public init(markdown: String) {
        let astr = try! AttributedString(markdown: markdown)
        self.init(astr)
    }
}
