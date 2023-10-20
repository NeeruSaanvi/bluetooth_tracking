//
//  LoginViewController.swift
//  awipower
//
//  Created by Pine Succeed on 26/11/20.
//

import UIKit
import KRProgressHUD
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit
import Toast_Swift

class LoginViewController: BaseClassController,GIDSignInDelegate {

    @IBOutlet weak var txtEmailId: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBOutlet weak var btnGoogleLogin: UIButton!
    
    @IBOutlet weak var btnforgetpassword: UIButton!
    @IBOutlet weak var loginbtnview: UIView!
    
    @IBOutlet weak var mainview: UIView!
    var googleSignIn = GIDSignIn.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginbtnview.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 8)
//        self.txtEmailId.text = "sss555@mailinator.com"
//        self.txtPassword.text = "12345678A"
        self.navigationController?.navigationBar.isHidden = true
        //        self.mainview.layer.borderWidth = 0.5
        //        self.mainview.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: btn sign in click
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        
        
        if(!Comman.validateTextFiled(textfiled: self.txtEmailId))
        {
            // show alert
            Comman.alertView(title: "Please enter email Id", message: "Please enter email id", object: self, cancelTitle: "Ok")
        }
        
        else if(!Comman.validateTextFiled(textfiled: self.txtPassword)){
            Comman.alertView(title: "Please enter password ", message: "Please enter email id", object: self, cancelTitle: "Ok")
        }
        
        
        else if(!Comman.validateEmailId(textfiled: self.txtEmailId))
        {
            Comman.alertView(title: "", message: "Please enter valid email id", object: self, cancelTitle: "Ok")
        }
        
        
        else{
            
            
            let model_login = Loginmodel()
            
            model_login.email = txtEmailId.text!
            model_login.password = txtPassword.text!
            
            
            
            model_login.login{ (success, message) in
                self.loginSuccessAndFaliurehandle(success: success, message: message)
            }
            
            
        }
        
    }
    
    //MARK: LoginApiCalling
    func loginSuccessAndFaliurehandle(success: Bool, message:String)
    {
        if(success)
        {
            
            DispatchQueue.main.async {
                let mainController = self.storyboard?.instantiateViewController(withIdentifier: "ConnectWithDeviceViewController") as! ConnectWithDeviceViewController
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.pushViewController(mainController, animated: true)
                
            }
            
        }
        else{
            DispatchQueue.main.async {
                Comman.alertView(title: "AWI", message: message, object: self, cancelTitle: "Ok")
            }
        }
    }
    
    //MARK:Google_sign:
    @IBAction func btngoogleLogin(_ sender: Any) {
        
        self.googleAuthLogin()
        
    }
    
    
    func googleAuthLogin() {
        self.googleSignIn?.delegate = self
        GIDSignIn.sharedInstance().presentingViewController = self
        self.googleSignIn?.signIn()
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        
        
        guard let user = user else {
            print("Uh oh. The user cancelled the Google login.")
            return
        }
        let userId = user.userID ?? ""
        print("Google User ID: \(userId)")
        
        let userIdToken = user.authentication.idToken ?? ""
        print("Google ID Token: \(userIdToken)")
        
        let userFirstName = user.profile.givenName ?? ""
        print("Google User First Name: \(userFirstName)")
        
        let userLastName = user.profile.familyName ?? ""
        print("Google User Last Name: \(userLastName)")
        
        let userEmail = user.profile.email ?? ""
        print("Google User Email: \(userEmail)")
        
        let googleProfilePicURL = user.profile.imageURL(withDimension: 150)?.absoluteString ?? ""
        print("Google Profile Avatar URL: \(googleProfilePicURL)")
        
        let loginModel = Loginmodel()
        loginModel.email = userEmail
        loginModel.socialId = userId
        let completename = userFirstName + userLastName
        loginModel.full_name = completename
        
        loginModel.socialLogin { (success, message) in
            self.loginSuccessAndFaliurehandle(success: success, message: message)
        }
        
        
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
        guard error == nil else {
            return
        }
        print("Successful Redirection")
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        print("dismissing Google SignIn")
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        print("presenting Google SignIn")
    }
    
    //MARK: Facebook_Signin
    
    @IBAction func btnFacebooklogin(_ sender: Any) {
        
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                    fbLoginManager.logOut()
                }
                
            }
        }
    }
    
    func getFBUserData(){
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    let dict = result as? [String : AnyObject]
                    print(result!)
                    print(dict as Any)
                    let name =  dict!["name"] as! String
                    
                    let loginModel = Loginmodel()
                    loginModel.email = dict!["email"] as! String
                    loginModel.socialId = dict!["id"] as! String
                    loginModel.full_name = name
                    loginModel.socialLogin { (success, message) in
                        self.loginSuccessAndFaliurehandle(success: success, message: message)
                    }
                    
                }
                else{
                   KRProgressHUD.showMessage("Fail to login via Facebook, Please try again")
                }
            })
        }
        
    }
    
    
    
    
    //MARK: SIGNUP_btn
    
    @IBAction func btnsignup(_ sender: Any) {
        
        DispatchQueue.main.async {
            let mainController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(mainController, animated: true)
        }
        
        
    }
    
    
    
    //MARK: ForgetPassword
    
    @IBAction func ForgetPassword_btnclicked(_ sender: Any) {
        
        DispatchQueue.main.async {
            let mainController = self.storyboard?.instantiateViewController(withIdentifier: "ForgetpasswordVC") as! ForgetpasswordVC
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(mainController, animated: true)
        }
        
        
    }
    
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
