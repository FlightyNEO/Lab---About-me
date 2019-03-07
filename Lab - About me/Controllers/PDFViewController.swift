//
//  PDFViewController.swift
//  Lab - About me
//
//  Created by Arkadiy Grigoryanc on 05/03/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import UIKit
import WebKit
import PDFKit

class PDFViewController: MainViewController {
    
    // MARK: - Private properties
    private let filePath: URL! = {
        return Bundle.main.url(forResource: "file", withExtension: "pdf")
    }()
    
    // MARK: - Outlets
    @IBOutlet weak var pdfView: PDFView! {
        didSet {
            pdfView.displayMode = .singlePageContinuous
            pdfView.autoScales = true
        }
    }
    
    // MARK: - Life ciles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openFile()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pdfView.autoScales = true
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        pdfView.autoScales = true
    }
    
    // MARK: - Private methods
    private func openFile() {
        let document = PDFDocument(url: filePath)
        pdfView.document = document
    }
    
}
