import SwiftUI
import CoreData

struct ContentView: View {

    @State private var problem: Problem = .init(
        id: "1",
        title: "Test",
        webUrl: URL(string: "https://atcoder.jp/contests/abs/tasks/practice_1")!,
        methods: [
            .add: MarkdownAddMethod()
        ]
    )

    @State private var contents: String = ""
    
    var body: some View {
        VStack {
            Text(markdown: contents)
        }
        .onAppear {
            Task {
                var request = URLRequest(url: problem.methods[.add]!.markdownURL!)
                request.httpMethod = "GET"

                let (data, _) = try await URLSession.shared.data(for: request)
                await MainActor.run(body: {
                    contents = String(
                        data: data,
                        encoding: .utf8
                    )!
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
