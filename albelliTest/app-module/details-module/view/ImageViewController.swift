//
//  ImageViewController.swift
//  albelliTest
//
//  Created by Alex Yaroshyn on 08/01/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit
import WebKit
import Photos

class ImageViewController: UIViewController {
    private let imageId: String
    private var webView: WKWebView!
    
    var presenter: ViewToPresenterDetailsProtocol?
    
    init(imageId: String) {
        self.imageId = imageId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let contentController = WKUserContentController();
        
        contentController.add(
            self,
            name: "callbackHandler"
        )
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        webView = WKWebView(frame: view.bounds, configuration:  config)
        webView.navigationDelegate = self
        view.addSubview(webView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadPage()
    }
    
    
    private func loadPage() {
        let url = Bundle.main.url(forResource: "testPage", withExtension: "html")!
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }
    
}



extension ImageViewController : WKScriptMessageHandler, WKNavigationDelegate {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if message.name == "callbackHandler" {
            presenter?.navigateToHomeView(navigationController: self.navigationController!)
        }
    }
    
    // function to call javascript function to load image file
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("loadImage(\"\(imageId)\")", completionHandler: nil)
    }
    
}

extension ImageViewController : PresenterToViewDetailsProtocol {
    func showError() {
        // handle error if any comes up..
        self.alert(message: "something went wrong.")
    }
    
}
