import SwiftUI
import MarkdownUI

struct ContentView: View {

    @State private var problem: Problem = .init(
        id: "1",
        title: "Test",
        webUrl: URL(string: "https://atcoder.jp/contests/abs/tasks/practice_1")!,
        methods: [
            .add: MarkdownAddMethod()
        ]
    )

    @State private var contents: Data?
    
    var body: some View {
        VStack {
            if let contents = contents {
                Markdown(try! Document(markdown: contents, options: .smart))
            }
        }
        .onAppear {
            Task {
                var request = URLRequest(url: problem.methods[.add]!.markdownURL!)
                request.httpMethod = "GET"

                let (data, _) = try await URLSession.shared.data(for: request)
                await MainActor.run(body: {
                    contents = data
                })
            }
        }
    }
}

extension Method {
    var markdownURL: URL? {
        guard let type = type as? MarkdownMethodType else {
            return nil
        }
        return type.input
    }

    var animationView: any AnimatableView {
        guard let type = type as? AnimationMethodType else {
            return EmptyView()
        }
        return type.animatableView
    }
}

extension EmptyView: AnimatableView {
    public typealias Input = Void

    public var input: Void {
        ()
    }

    public init(input: Void) {
        self.init()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
