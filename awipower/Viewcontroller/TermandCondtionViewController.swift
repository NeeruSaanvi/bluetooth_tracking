//
//  TermandCondtionViewController.swift
//  awipower
//
//  Created by Srajan on 10/11/20.
//

import UIKit
import WebKit

class TermandCondtionViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "http://192.168.1.12/awi_power_pass/admin/terms")
        let requestObj = URLRequest(url: url!)
        webview.load(requestObj)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func accept_reject_button(sender:UIButton){
        if sender.tag == 0{
            DispatchQueue.main.async {
            let mainController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(mainController, animated: true)
            }
        }else {
            
        }
    }
}
