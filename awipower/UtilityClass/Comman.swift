//
//  Common.swift
//  TMA
//
//  Created by PineSucceed MacMini1 on 12/04/18.
//  Copyright © 2018 PineSucceed MacMini1. All rights reserved.
//



import Foundation
import UIKit
import KRProgressHUD

private var associationKey: UInt8 = 0
class Comman: NSObject {
    
    static let SharedCommon = Comman()
    
    // MARK: UIAlertView Comman Method
    
    
    class func alertView(title: String, message: String, object: AnyObject, cancelTitle: String)
    {
        DispatchQueue.main.async {
            var alertView = UIAlertController()
            alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel)
            {
                
                action -> Void in
                
            }
            alertView.addAction(cancelAction)
            alertView.show()
        }
        
        
        //        DispatchQueue.main.async {
        //
        //            let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        //            alertWindow.rootViewController = UIViewController()
        //            alertWindow.windowLevel = UIWindow.Level.alert + 1;
        //            alertWindow.makeKeyAndVisible()
        //            alertWindow.rootViewController?.present(alertView, animated: true, completion: nil)
        //
        //        }
        
        
        
        
    }
    //
    //        DispatchQueue.main.async {
    //
    //        AppDelegate.init().window?.rootViewController?.present(alertView, animated: true, completion: nil)
    //        }
    
    //    }
    
    //    func func_HideAlertView()
    //    {
    //        alertView.dismiss(animated: true, completion: nil)
    //    }
    
    // MARK: ActionSheet Comman Method
    class func actionSheet(title: String, message: String, object: AnyObject, cancelTitle: String)
    {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Approve", style: .default , handler:{ (UIAlertAction)in
            //            print("User click Approve button")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Edit", style: .default , handler:{ (UIAlertAction)in
            //            print("User click Edit button")
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction)in
            //            print("User click Delete button")
        }))
        
        actionSheet.addAction(UIAlertAction(title:cancelTitle, style: .cancel, handler:{ (UIAlertAction)in
            //            print("User click Dismiss button")
        }))
        
        
        object.present(actionSheet, animated: true, completion: {
            //            print("completion block")
        }) }
    
    
    
    
    // MARK: validate TextField
    class func validateTextFiled(textfiled: UITextField) -> Bool {
        
        textfiled.text = textfiled.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if textfiled.text==nil || textfiled.text == ""
        {
            return false
        }
        
        return true
        
    }
    
    class func validateTextFiledWithRange(textfiled: UITextField) -> Bool {
        
        textfiled.text = textfiled.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if textfiled.text==nil || textfiled.text == "" || textfiled.text!.count >= 30 || textfiled.text!.count <= 60
        {
            return false
        }
        
        return true
        
    }
    
    
    class func validateEmailId(textfiled: UITextField) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: textfiled.text)
        
    }
    
    
    class func trimString(string: String) -> String {
        
        return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        
        
    }
    
    
    //    func validateTextFiled(textfiled: UITextField) -> Bool {
    //
    //        textfiled.text = textfiled.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    //
    //        if textfiled.text==nil || textfiled.text == ""
    //        {
    //            return false
    //        }
    //
    //        return true
    //    }
    
    // MARK: validate TextView
    class func validateTextView(textView: UITextView) -> Bool {
        
        textView.text = textView.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if textView.text==nil || textView.text == ""
        {
            return false
        }
        return true
    }
    
    //  Converted to Swift 4 by Swiftify v4.1.6710 - https://objectivec2swift.com/
    class func getStoryboard() -> UIStoryboard? {
        let str = "Main"
        //        str = "Main_PetSitter"
        //            print("story board is:-\(UIStoryboard(name: str, bundle: nil))")
        return UIStoryboard(name: str, bundle: nil)
    }
    
    class func getStoryboardMerchant() -> UIStoryboard? {
        let str = "MainMerchant"
        //        str = "Main_PetSitter"
        //            print("story board is:-\(UIStoryboard(name: str, bundle: nil))")
        return UIStoryboard(name: str, bundle: nil)
    }
    
    class func getStoryboardMerchant2() -> UIStoryboard? {
        let str = "Merchant2"
        //        str = "Main_PetSitter"
        //            print("story board is:-\(UIStoryboard(name: str, bundle: nil))")
        return UIStoryboard(name: str, bundle: nil)
    }
    
    
    class func getStoryboardProductNService() -> UIStoryboard? {
        let str = "ProductAndService"
        //        str = "Main_PetSitter"
        //            print("story board is:-\(UIStoryboard(name: str, bundle: nil))")
        return UIStoryboard(name: str, bundle: nil)
    }
    
    class func getStoryboardSettings() -> UIStoryboard? {
        let str = "MerchantProfile"
        //        str = "Main_PetSitter"
        //            print("story board is:-\(UIStoryboard(name: str, bundle: nil))")
        return UIStoryboard(name: str, bundle: nil)
    }
    
    class func getStoryboardReport() -> UIStoryboard? {
        let str = "Report"
        //        str = "Main_PetSitter"
        //            print("story board is:-\(UIStoryboard(name: str, bundle: nil))")
        return UIStoryboard(name: str, bundle: nil)
    }
    
    class func getStoryboardHelp() -> UIStoryboard? {
        let str = "GetHelp"
        //        str = "Main_PetSitter"
        //            print("story board is:-\(UIStoryboard(name: str, bundle: nil))")
        return UIStoryboard(name: str, bundle: nil)
    }
    
    //array to string
    class func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
}



extension UIAlertController {
    
    private var alertWindow: UIWindow! {
        get {
            return objc_getAssociatedObject(self, &associationKey) as? UIWindow
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, &associationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func show() {
        //        DispatchQueue.main.async {
        
//        if let window = UIWindowScene.focused.map(UIWindow.init(windowScene:)) {
//            window.rootViewController = myViewController
//            window.makeKeyAndVisible()
//        }
        let windowScene = UIApplication.shared
                        .connectedScenes
                        .filter { $0.activationState == .foregroundActive }
                        .first
        if let windowScene = windowScene as? UIWindowScene {
            self.alertWindow = UIWindow(windowScene: windowScene)
        }
        
        
//        self.alertWindow = UIWindow //.init(frame: UIScreen.main.bounds)
        self.alertWindow.backgroundColor = .clear
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        self.alertWindow.rootViewController = viewController
        
        let topWindow = UIApplication.shared.windows.last
        if let topWindow = topWindow {
            self.alertWindow.windowLevel = topWindow.windowLevel + 1
        }
        if(self.alertWindow != nil){
            self.alertWindow.makeKeyAndVisible()
            self.alertWindow.rootViewController?.present(self, animated: true, completion: nil)
        }
        //        }
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if(self.alertWindow != nil){
            self.alertWindow.isHidden = true
            self.alertWindow = nil
        }
    }
}


