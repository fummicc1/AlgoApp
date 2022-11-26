import Foundation
import SwiftUI


extension Text {
    public init(markdown: String) {
        let astr = try! AttributedString(
            markdown: markdown,
            options: AttributedString.MarkdownParsingOptions(
                allowsExtendedAttributes: true,
                interpretedSyntax: .full
            )
        )
        self.init(astr)
    }
}
