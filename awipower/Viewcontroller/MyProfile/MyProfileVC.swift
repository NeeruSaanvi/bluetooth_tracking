//
//  MyProfileVC.swift
//  awipower
//
//  Created by Srajan on 06/11/20.
//

import UIKit
import  KRProgressHUD
import CountryPickerView
import SDWebImage
class MyProfileVC: BaseClassController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate,CountryPickerViewDelegate, convert_heightdatatoinches, weight_datasendregister{
    
    @IBOutlet weak var demoshow: UIImageView!
    @IBOutlet weak var titilelbl: UILabel!
    @IBOutlet weak var addresstxtfield: UITextField!
    @IBOutlet weak var heighttxtfiled: UITextField!
    @IBOutlet weak var weighttxtfiled: UITextField!
    @IBOutlet weak var dobtxtfield: UITextField!
    @IBOutlet weak var gendertxtfield: UITextField!
    @IBOutlet weak var phonetxtfield: UITextField!
    @IBOutlet weak var emailtxtfield: UITextField!
    @IBOutlet weak var imgProfileImage: UIImageView!
    @IBOutlet weak var submitbtn: UIStackView!
    @IBOutlet weak var txtFullName:UITextField!
    @IBOutlet weak var profle_imagebtn: UIButton!
    
    @IBOutlet weak var weight_btn: UIButton!
    @IBOutlet weak var height_btn: UIButton!
    var screenchange = ""
    var profilemodel = ModelProfile()

    let countrypick = CountryPickerView()
    var hegitdata = ""
    var weightdata = ""
    var height_unit = ""
    var weight_unit = ""
    var countrycode = ""
   
    @IBOutlet weak var countripieck: CountryPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
           addSlideMenuButton()
        self.navigationItem.title = "My Profile"
        // Do any additional setup after loading the view.
        submitbtn.isHidden = true
        gendertxtfield.delegate = self
        dobtxtfield.delegate = self
        heighttxtfiled.delegate = self
        countripieck.delegate = self
        let button1 = UIBarButtonItem(image: UIImage(named: "edit.png"), style: .plain, target: self, action:#selector(editbutton)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
        button1.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        profle_imagebtn.addTarget(self, action:#selector(selectUserImage), for:.touchUpInside)
        disable_textField()
        datashowProfile_user()
        profilemodel.editProfile { (succees, message) in
            if succees {
                KRProgressHUD.show()
            }else {
                KRProgressHUD.showMessage(message)
            }
            
            KRProgressHUD.dismiss()
        }
        
    }

    //MARK: DataShowProfileuser
    func datashowProfile_user(){
        addresstxtfield.text = ModelProfile.shared.address
        emailtxtfield.text = ModelProfile.shared.email
        gendertxtfield.text = ModelProfile.shared.gender
        dobtxtfield.text = ModelProfile.shared.dob
        txtFullName.text = ModelProfile.shared.first_name
        phonetxtfield.text = ModelProfile.shared.phone_no
        heighttxtfiled.text = ModelProfile.shared.height + "cm"
        weighttxtfiled.text = ModelProfile.shared.weight + "lbs"
    }

    //MARK: Disable TextField:

    func disable_textField(){
        addresstxtfield.isEnabled = false
        heighttxtfiled.isEnabled = false
        dobtxtfield.isEnabled = false
        phonetxtfield.isEnabled = false
        phonetxtfield.isEnabled = false
        profle_imagebtn.isEnabled = false
        gendertxtfield.isEnabled = false
        txtFullName.isEnabled = false
        emailtxtfield.isEnabled = false
        weight_btn.isEnabled = false
        height_btn.isEnabled = false
        weight_btn.backgroundColor = #colorLiteral(red: 0.9613141418, green: 0.4986458421, blue: 0.4898355603, alpha: 1)
        height_btn.backgroundColor = #colorLiteral(red: 0.9613141418, green: 0.4986458421, blue: 0.4898355603, alpha: 1)
    }

    //MARK: EDITPROFILEAPICALLING:
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        DispatchQueue.main.async {
            let imageurl = utilityObject.kImageBaseUrl + ModelProfile.shared.profile_image
            self.imgProfileImage.sd_setImage(with: URL(string:imageurl), placeholderImage:UIImage(named:"user"))
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

    @IBAction func editbutton(_ sender: Any) {
        screenchange = "My Profile"
        self.navigationItem.title = screenchange
      //  titilelbl.text = screenchange
        submitbtn.isHidden = false
        enable_textField()
    }
    //MARK: Enable TextField:
    
    func enable_textField(){
        addresstxtfield.isEnabled = true
        heighttxtfiled.isEnabled = true
        dobtxtfield.isEnabled = true
        phonetxtfield.isEnabled = true
        profle_imagebtn.isEnabled = true
        gendertxtfield.isEnabled = true
        txtFullName.isEnabled = true
        emailtxtfield.isEnabled = false
        weight_btn.isEnabled = true
        height_btn.isEnabled = true
        weight_btn.backgroundColor = #colorLiteral(red: 0.9792701602, green: 0.2120947838, blue: 0, alpha: 1)
        height_btn.backgroundColor = #colorLiteral(red: 0.9792701602, green: 0.2120947838, blue: 0, alpha: 1)
    }
    
    @IBAction func submit_btn(_ sender: Any) {
        submitbtn.isHidden = true
        edit_Profiledata()
        disable_textField()
    }
    
    func edit_Profiledata(){
        if(Comman.validateTextFiled(textfiled: txtFullName) != true)
        {
            Comman.alertView(title: "Blank Field", message: "Please Enter First Full name", object: self, cancelTitle: "OK")
        }
        else
            if(Comman.validateTextFiled(textfiled: heighttxtfiled) != true)
            {
                Comman.alertView(title: "Blank Field", message: "Please Enter Height", object: self, cancelTitle: "OK")
            }
//            else
//                if(Comman.validateTextFiled(textfiled: dobtxtfield) != true)
//                {
//                    Comman.alertView(title: "Blank Field", message: "Please enter Date Birth", object: self, cancelTitle: "OK")
//                }
//                else if(Comman.validateTextFiled(textfiled: gendertxtfield) != true)
//                {
//                    Comman.alertView(title: "Blank Field", message: "Please enter Gender", object: self, cancelTitle: "OK")
//                }
                //else if (Comman.validateTextFiled(textfiled: emailtxtfield) != true)
//                {
//                    Comman.alertView(title: "Blank Field", message: "Please enter Phone Number", object: self, cancelTitle: "OK")
//                }
//                else if (phonetxtfield.text!.count != 10)
//                    {
//                        Comman.alertView(title: "Phone Number", message: "phone Number length must be in 10 digit", object: self, cancelTitle: "OK")
//                    }
//                else if(!Comman.validateEmailId(textfiled: self.emailtxtfield))
//                {
//                   Comman.alertView(title: "", message: "Please enter valid email id", object: self, cancelTitle: "Ok")
//                }
//
                else
                {
              
                    
                    profilemodel.fullName = txtFullName.text!
                    profilemodel.address = addresstxtfield.text!
                    profilemodel.gender = gendertxtfield.text!
                    profilemodel.fileData = imgProfileImage.image
                    profilemodel.country_code = countrycode
                    profilemodel.phone_no = phonetxtfield.text!
                    profilemodel.dob = dobtxtfield.text!
                    profilemodel.height = heighttxtfiled.text!
                    profilemodel.weight = weighttxtfiled.text!
                    profilemodel.height_unit = height_unit
                    profilemodel.weight_unit = weight_unit
                    
                    
                    
                    
                    let dateFormatterGet = DateFormatter()
                    dateFormatterGet.dateFormat = "MM-dd-yyyy"
                    
                    //            let yourDate = dateFormatterGet.string(from: (obj as! Date) )
                    
                    let date = dateFormatterGet.date(from: dobtxtfield.text!)
                    
                    if(date != nil)
                    {
                    dateFormatterGet.dateFormat = "yyyy-MM-dd"
                    profilemodel.dob = dateFormatterGet.string(from: date!)
                    }
                    
                    //modelSetting.dob = txtDob.text!
                    
                  
                    
                    profilemodel.changeProfile(){
                        (success,message) in
                        if(success)
                        {
                            KRProgressHUD.showMessage("Profile has been updated successfully")
                           
                                
                            ModelProfile.shared.fullName =  self.txtFullName.text!
                            ModelProfile.shared.dob =  self.dobtxtfield.text!
                            ModelProfile.shared.address = self.addresstxtfield.text!
                            ModelProfile.shared.gender =  self.gendertxtfield.text!
                            ModelProfile.shared.fileData = self.imgProfileImage.image
                            ModelProfile.shared.height = self.heighttxtfiled.text!
                            ModelProfile.shared.weight =  self.weighttxtfiled.text!
                          
                            
                           
                        }
                        else
                        {
                            KRProgressHUD.showMessage(message)
                        }
                        KRProgressHUD.dismiss()
                    }
        }
        
    }
   

    
    @IBAction func cancelbutton(_ sender: Any) {
        screenchange = "My Profile"
        submitbtn.isHidden = true
        self.navigationItem.title = screenchange
        disable_textField()
    }
    
    
    
    //MARK:- textfield delegates
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == gendertxtfield)
        {
            self.view.endEditing(true)
            PickerClass.sharedinstance.upPickerShow(withArray: ["Male","Female","Other"], withkey: "", withTag: 0) { (picker, obj) in
                self.gendertxtfield.text = (obj as! String)
            }
            return false
        }
        else if(textField == dobtxtfield){
            self.view.endEditing(true)
            let picker = PickerClassforView.sharedinstance.showDatePicker { (picker, obj) in
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                let yourDate = dateFormatterGet.string(from: (obj as! Date) )
                
                let date = dateFormatterGet.date(from: yourDate)
                
                dateFormatterGet.dateFormat = "MM-dd-yyyy"
                self.dobtxtfield.text = dateFormatterGet.string(from: date!)
            }
            picker.maximumDate = Date()
            picker.datePickerMode = .date
            
            return false
        }
        else if(textField == heighttxtfiled)
        {
            self.view.endEditing(true)
            let arrayHeight = NSMutableArray()
            for index in 50...250
            {
                arrayHeight.add(index)
            }
            PickerClass.sharedinstance.upPickerShow(withArray: arrayHeight, withkey: "", withTag: 0) { (picker, obj) in
                print("Abhishek\(obj)")
                let height = obj as! NSNumber
                self.heighttxtfiled.text = (height.stringValue)
            }
            return false
        }
        
        return true
    }
    
   
    //MARK:- Select User Image
    @objc func selectUserImage(sender: UIButton){
            
            
            let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
            
            let actionSheet = UIAlertController(title: "Photo Source ", message: "Choose a Source", preferredStyle: .actionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "Photo Libraray", style: .default, handler: { (action:UIAlertAction) in
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
                
                //            self.modelRegistration.fileType = "image
            }))
        
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
                }else{
                //            print("Camera not available")
                }
            
            }))
            
            actionSheet.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil))
            
            let topWindow = UIWindow(frame: UIScreen.main.bounds)
            //        topWindow.rootViewController = UIViewController()
            //        topWindow.windowLevel = UIWindow.Level.alert + 0.8
            
            
            if let presenter = actionSheet.popoverPresentationController {
                
                presenter.sourceView = topWindow
                //            presenter.sourceRect = cell.imgLogo.bounds
                presenter.sourceRect =  CGRect(x:topWindow.bounds.midX, y: topWindow.bounds.midY, width: 0, height: 0)
                presenter.permittedArrowDirections = []
            }
            
            //        topWindow.makeKeyAndVisible()
            actionSheet.show()
            //
            
            
        }
        
        //MARK:- Image Picker Functions
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            
            guard let selectedImage = info[.originalImage] as? UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
            
            
            // Set photoImageView to display the selected image.
            //        photoImageView.image = selectedImage
            
            
            imgProfileImage.image = selectedImage
            //
            // Dismiss the picker.
            dismiss(animated: true, completion: nil)
        }
        
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            print("Image Picker dismissed ")
            
            picker.dismiss(animated: true, completion: nil)
            
            
            
        }
        
        
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.countrycode = country.phoneCode
        
    }
    
    
    
    func data_show_weight(dataadd: String, weight_unit: String, Kg: String, gram: String) {
        if weight_unit == "2"{
        self.weighttxtfiled.text = Kg + "kg." + gram + "gm."
        }else {
        self.weighttxtfiled.text = dataadd + "lbs"
        }
        self.weightdata = dataadd

        self.weight_unit = weight_unit
      
    }
    func heighconvert_incm(cmdata: String, height_unit: String,inchdata: String, ftdata: String) {
       
        if height_unit == "2"{
            self.heighttxtfiled.text =  ftdata + "ft." + " "  + inchdata + "in."
        }else {
            self.heighttxtfiled.text = cmdata + "cm"
        }
        hegitdata = cmdata
        self.height_unit = height_unit
//        heighttxtfiled.text = hegitdata + meterpara
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
