//
//  CahangePasswordVC.swift
//  awipower
//
//  Created by Srajan on 17/11/20.
//

import UIKit
import KRProgressHUD

class ChangePasswordVC: BaseClassController {
    
    @IBOutlet weak var textOldPassword: UITextField!
    @IBOutlet weak var textNewPassword: UITextField!
    @IBOutlet weak var textConfirmPassword: UITextField!
    
   var modelSettings = Model_Settings()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton()
        self.navigationItem.title = "Change Password"

      
    }
    
    
   
    @IBAction func updatePassword(_ sender: Any) {
        
        if(Comman.validateTextFiled(textfiled: textOldPassword) != true)
        {
            Comman.alertView(title: "Blank Password", message: "Please Enter Your Current Password ", object: self, cancelTitle: "Ok")
            
        }
        else if(Comman.validateTextFiled(textfiled: textNewPassword) != true)
        {
            Comman.alertView(title: "Blank Password", message: "Please Enter Your New Password ", object: self, cancelTitle: "Ok")
            
        }
        else if(Comman.validateTextFiled(textfiled: textNewPassword) != true)
        {
            Comman.alertView(title: "Blank Password", message: "Please Enter Confirm Password ", object: self, cancelTitle: "Ok")
        }
        else if(textNewPassword.text != textConfirmPassword.text  )
        {
            Comman.alertView(title: "Not Matched", message: "Password Not Matched! ", object: self, cancelTitle: "Ok")
        }
        else {
            
            modelSettings.currentPassord = self.textOldPassword.text!
            modelSettings.newPassword = self.textNewPassword.text!

            
            
            modelSettings.changePassword{
                    (success,message) in
                    
                    if(success)
                    {
                        KRProgressHUD.showMessage("Password Update Suceesfully")
                    }
                    else
                    {
                        KRProgressHUD.showMessage(message)
                    }
                   KRProgressHUD.dismiss()
                    
                    
            }
    
        }
        
        
        
        
        
    }

}
