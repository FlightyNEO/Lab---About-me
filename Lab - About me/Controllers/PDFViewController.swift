//
//  PDFViewController.swift
//  Lab - About me
//
//  Created by Arkadiy Grigoryanc on 05/03/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit
import WebKit

class PDFViewController: MainViewController {
    
    // MARK: - Private properties
    private let filePath: URL! = {
        return Bundle.main.url(forResource: "file", withExtension: "pdf")
    }()
    
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activtyIndicator: UIActivityIndicatorView!
    
    // MARK: - Life ciles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set webView
        webView.navigationDelegate = self
        
        openFile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activtyIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webView.reload()
    }
    
    // MARK: - Private methods
    private func openFile() {
        let request = URLRequest(url: filePath)
        webView.load(request)
    }
    
}

// MARK: - WKNavigationDelegate
extension PDFViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activtyIndicator.stopAnimating()
    }
    
}
