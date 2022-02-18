//
//  GenericWebViewController.swift
//  CiceMusic
//
//  Created by cice on 16/02/2022.
//

import UIKit
import WebKit

protocol GenericWebOutputPresenterProtocol {
    
}

class GenericWebViewController: UIViewController {
    
    // MARK: - ID
    var presenter: GenericWebPresenterInputProtocol?
    
    // MARK - Variables globales
    var myWebViewContainer: WKWebView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // MARK: - IBOutlets
    @IBOutlet weak var contentWebView: UIView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.appDelegate.canRotate = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionWebViow()
        self.loadWebView()
        // Do any additional setup after loading the view.
    }

    private func configuracionWebViow(){
        self.title = "Cice Music Web"
        self.myActivityIndicator.isHidden = false
        self.myActivityIndicator.startAnimating()
        
        let contentWebView = WKUserContentController()
        let config = WKWebViewConfiguration()
        let prefers = WKWebpagePreferences()
        
        prefers.allowsContentJavaScript = true
        self.myWebViewContainer = WKWebView(frame: self.contentWebView.bounds, configuration: config)
        self.myWebViewContainer.configuration.userContentController = contentWebView
        self.myWebViewContainer.navigationDelegate = self
        
        self.contentWebView.addSubview(self.myWebViewContainer)
    }
    
    private func loadWebView(){
        guard let urlUnw = URL(string: "http://www.icologic.co") else {return}
        self.myWebViewContainer.load(URLRequest(url: urlUnw))
        self.appDelegate.canRotate = true
    }

}

extension GenericWebViewController: GenericWebOutputPresenterProtocol{
    
}

extension GenericWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.myActivityIndicator.isHidden = true
        self.myActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        //
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        //
    }
}
