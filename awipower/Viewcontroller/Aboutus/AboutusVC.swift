//
//  AboutusVC.swift
//  awipower
//
//  Created by Srajan on 25/11/20.
//

import UIKit
import WebKit
class AboutusVC: BaseClassController {

    @IBOutlet weak var webview: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        let url = URL (string: "http://192.168.1.12/awi_power_pass/admin/about")
        let requestObj = URLRequest(url: url!)
        webview.load(requestObj)
        navigationItem.title = "About Us"
        // Do any additional setup after loading the view.
    }
   

}
