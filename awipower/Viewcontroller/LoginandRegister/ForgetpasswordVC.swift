//
//  ForgetpasswordVC.swift
//  awipower
//
//  Created by Srajan on 11/11/20.
//

import UIKit
import KRProgressHUD

class ForgetpasswordVC: UIViewController {
let forgetmodel = ModelForgetPassword()
    @IBOutlet weak var emailtxt:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Forget Passsword"
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func submit_btn(sender: UIButton){
      //  emailtxt.text = forgetmodel.email
        forget_apicalling()
    }
    
    @IBAction func resend_btn(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    func forget_apicalling(){
        if(!Comman.validateEmailId(textfiled: self.emailtxt))
        {
            Comman.alertView(title: "", message: "Please enter valid email id", object: self, cancelTitle: "Ok")
        }else {
            forgetmodel.email = emailtxt.text!
            forgetmodel.ModelForgetPasswordget{ (success, message) in
                self.loginSuccessAndFaliurehandle(success: success, message:message)
            }
        }
            
    }
    
    func loginSuccessAndFaliurehandle(success: Bool, message:String)
    {
        if(success)
        {
            //
            
          
        }
        else{
            KRProgressHUD.showMessage(message)
        }
    }
   
    
      
      
      //  self.loginSuccessAndFaliurehandle(success: success, message: message)
 
}
