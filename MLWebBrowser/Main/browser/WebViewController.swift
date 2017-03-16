//
//  WebViewController.swift
//  MLWebBrowser
//
//  Created by Mrlu-bjhl on 09/03/2017.
//  Copyright © 2017 Mrlu. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {

    lazy var webViewConfiguration:WKWebViewConfiguration? = {
        return nil
    }()
    
    lazy var webView:WKWebView = {
        let webView = WKWebView(frame: self.view.bounds)
        webView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        webView.navigationDelegate = self
        webView.uiDelegate = self
        return webView
    }()
    
    lazy var loadingView:YYLoadProgressView = {
        let loadProgressView:YYLoadProgressView = YYLoadProgressView(loadProgressViewStyle: .small)
        self.view.addSubview(loadProgressView)
        return loadProgressView
    }()
    
    var url:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
        loadViewData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func loadViewData() {
        if url != nil {
            webView.load(URLRequest(url: url!))
        }
    }
    
    func setUpView() {
        view.addSubview(webView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    //        if webView.isEqual(object) {
    //            if keyPath == "estimatedProgress" {
    //                let newValue = change?[NSKeyValueChangeNewKey]
    //                if newValue != nil {
    //                    if newValue!.intValue == 1 {
    //                        //进度完成
    //
    //                    } else {
    //                        //进行中
    //
    //                    }
    //                } else {
    //                    //进度完成
    //                }
    //            }
    //        }
    //    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingView.stopAnimating()
    }
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
//        
//    }
}
