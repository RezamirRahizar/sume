//
//  WebViewRepresentable.swift
//  sume
//
//  Created by Rezamir on 15/04/2026.
//

import SwiftUI
import WebKit

struct WebViewRepresentable: UIViewRepresentable {
    let html: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false //disable inner scroll as outer scrollview handles it
        webView.loadHTMLString(html, baseURL: nil)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
}
