import SwiftUI

#if os(iOS)
typealias ViewRepresentable = UIViewRepresentable
#elseif os(macOS)
typealias ViewRepresentable = NSViewRepresentable
#endif


@main
struct iOSAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
