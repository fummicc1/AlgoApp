import Foundation
import SwiftUI
import WebKit

struct WebView: ViewRepresentable {
    var loadUrl:String


#if os(macOS)
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
#elseif os(iOS)
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

#endif
#if os(macOS)
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.load(URLRequest(url: URL(string: loadUrl)!))
    }
#elseif os(iOS)
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
#endif
}
