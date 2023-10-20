//
//  RegisterVC.swift
//  awipower
//
//  Created by Srajan on 03/11/20.
//

import UIKit
import KRProgressHUD
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class RegisterVC: UIViewController,GIDSignInDelegate,convert_heightdatatoinches,weight_datasendregister{
    
    
  
    
    
    
    
    
    
    
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtconfirmPassword: UITextField!
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnGoogleLogin: UIButton!

    @IBOutlet weak var btnforgetpassword: UIButton!
    @IBOutlet weak var loginbtnview: UIView!
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var text_height:UITextField!
    @IBOutlet weak var text_wedight:UITextField!
    var height = ""
    var weight = ""
    var height_unit =  ""
    var weight_unit = ""
    
    
    var googleSignIn = GIDSignIn.sharedInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginbtnview.roundCorners(corners: [.bottomLeft, .bottomRight], radius:4.5)
        
        
     //   mainview.roundCorners(corners: [.topRight,.topLeft,.bottomRight], radius: 16)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        
//     //   mainview.layer.borderWidth = 2
//        mainview.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    //    mainview.layer.cornerRadius = 8
//        mainview.clipsToBounds = true
//        mainview.roundCorners(corners: [.topRight,.topLeft,.bottomLeft], radius: 8)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    //MARK: btn sign in click
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        
        
        if(!Comman.validateTextFiled(textfiled: self.txtname))
        {
            // show alert
            Comman.alertView(title: "Awi", message: "Please enter name", object: self, cancelTitle: "Ok")
        }
            
        else if(!Comman.validateTextFiled(textfiled: self.text_height)){
            
            Comman.alertView(title: "Awi", message: "Please enter height", object: self, cancelTitle: "Ok")
        }
        else if(!Comman.validateTextFiled(textfiled: self.text_wedight)){
            
            Comman.alertView(title: "Awi", message: "Please enter weight", object: self, cancelTitle: "Ok")
        }
        else if(!Comman.validateEmailId(textfiled: self.txtEmailId))
        {
            Comman.alertView(title: "Awi", message: "Please enter valid email id", object: self, cancelTitle: "Ok")
        }
        else if(!Comman.validateTextFiled(textfiled: self.txtEmailId))
        {
            Comman.alertView(title: "Awi", message: "Please enter email id", object: self, cancelTitle: "Ok")
        }
        else if(!Comman.validateTextFiled(textfiled: self.txtPassword)){
            
            Comman.alertView(title: "Awi", message: "Please enter email id", object: self, cancelTitle: "Ok")
        }else if  (!Comman.validateTextFiled(textfiled: self.txtconfirmPassword)){
            Comman.alertView(title: "Awi", message: "Please enter confirmPassword id", object: self, cancelTitle: "Ok")
        }else if  (!Comman.validateTextFiled(textfiled: self.txtconfirmPassword)) {
            
            Comman.alertView(title: "Awi", message: "Please enter Correctpassword", object: self, cancelTitle: "Ok")
        }else {
            let model_register = registermodel()
            model_register.email = txtEmailId.text!
            model_register.password = txtPassword.text!
            model_register.name = txtname.text!
            model_register.addheight = height
            model_register.addwedight = weight
            model_register.weight_unit = weight_unit
            model_register.height_unit = height_unit
            model_register.register_up{ (success, message) in
            self.loginSuccessAndFaliurehandle(success: success, message: message)
               
                
              
            }
            
            
        }
        
    }
    
//    //MARK: heightconvert
//    func heighconvert_incm(cmdata: String) {
//
//
//    }
    
    
    func heighconvert_incm(cmdata: String, height_unit: String, inchdata: String, ftdata: String) {
        
        if height_unit == "2"{
            self.text_height.text =  ftdata + "ft." + " "  + inchdata + "in."
          
        }else {
            self.text_height.text = cmdata + "cm"
        }
        self.height = cmdata
        self.height_unit = height_unit
        
    }
    
   
    
    //MARK: weightconvert
    
 func data_show_weight(dataadd: String, weight_unit: String, Kg: String, gram: String){
        
        if weight_unit == "2"{
        self.text_wedight.text = Kg + "kg." + gram + "gm."
        }else {
        self.text_wedight.text = dataadd + "lbs"
        }
        self.weight = dataadd
       
        self.weight_unit = weight_unit
    }
    
    
    //MARK: LoginApiCalling
    func loginSuccessAndFaliurehandle(success: Bool, message:String)
    {
        if(success)
        {
            //
            Comman.alertView(title: "Awi", message: "Thank you for registration, Please verify your email address.", object: self, cancelTitle: "Ok")
            DispatchQueue.main.async {
            let mainController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(mainController, animated: true)
            }

        }
        else{
            KRProgressHUD.showMessage(message)
        }
        KRProgressHUD.dismiss()
    }
    
    
    
    
    
    //MARK:Google_sign:
    @IBAction func btngoogleLogin(_ sender: Any) {
        
        self.googleAuthLogin()
        
    }
    
    
    func googleAuthLogin() {
        self.googleSignIn?.delegate = self
//        self.googleSignIn?.uiDelegate = self
        GIDSignIn.sharedInstance().presentingViewController = self
       self.googleSignIn?.signIn()
    //signIn()
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
        
         
        
        
        //loginModel.socialId = userId
       
        
        loginModel.socialLogin { (success, message) in
            self.loginSuccessAndFaliurehandle(success: success, message: message)
        }
        
        
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {

    }
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
        guard error == nil else {
            
//            print("Error while trying to redirect : \( error)")
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
//                if fbloginresult.grantedPermissions != "" {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        fbLoginManager.logOut()
                    }
//                }
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
        let mainController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(mainController, animated: true)
        }
        
    
    }
    
    
    //MARK: Height_btnAction
    
    @IBAction func Height_btnAction(_ sender: Any) {
        DispatchQueue.main.async {
        let mainController = self.storyboard?.instantiateViewController(withIdentifier: "AgePickerviewVc") as! AgePickerviewVc
        self.navigationController?.navigationBar.isHidden = true
            mainController.delegate = self
        self.navigationController?.pushViewController(mainController, animated: true)
        }
        
    }
        
    @IBAction func wedight_btnAction(_ sender: Any) {
        DispatchQueue.main.async {
        let mainController = self.storyboard?.instantiateViewController(withIdentifier: "WeightPickerViewViewController") as! WeightPickerViewViewController
            mainController.deligate = self
        self.navigationController?.navigationBar.isHidden = true
        
        self.navigationController?.pushViewController(mainController, animated: true)
        }
        
    }
        
    
    
    
    
    
    
    
    
    

}

