//
//  File.swift
//  
//
//  Created by devdchaudhary on 23/05/23.
//

import SwiftUI
import WebKit

struct WebRepresentable : UIViewRepresentable {
    
    @Binding var url: String
    private var onLoad: (() -> Void)?
    
    init(_ url: Binding<String>, onLoad: (() -> Void)?) {
        self._url = url
        self.onLoad = onLoad
    }

    func makeUIView(context: Context) -> WKWebView  {
        
        let view = WKWebView()
        view.uiDelegate = context.coordinator
        view.navigationDelegate = context.coordinator
        
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = URL(string: $url.wrappedValue) {
            let req = URLRequest(url: url)
            webView.uiDelegate = context.coordinator
            webView.navigationDelegate = context.coordinator
            webView.allowsBackForwardNavigationGestures = true
            webView.load(req)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        
        let parent: WebRepresentable
        
        init(_ parent: WebRepresentable) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.onLoad?()
        }
        
    }

}
