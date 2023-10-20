//
//  Model_Profile.swift
//  DDM IOS
//
//  Created by PineSucceed MacMini1 on 27/01/20.
//  Copyright © 2020 PineSucceed MacMini1. All rights reserved.
//

import UIKit
import KRProgressHUD
import SDWebImage
class ModelProfile: NSObject {
    

    var address: String = ""
    var city: String = ""
    var created_date: String = ""
    var email: String = ""
    var email_token: String = ""
  
    var first_name: String = ""
    var id: String = ""
    var lat : String = ""
    var lng : String = ""
    //let image_url = ""
    var last_name: String = ""
    // let lat = ""
    //let lng = ""
    var number: String = ""
    var roll_type: String = ""
    var state: String = ""
    var gender: String = ""
    var dob: String = ""
    var profile_image: String = ""
    var phone_no: String = ""
    var fullName : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var workingAt : String = ""
    var emailId : String = ""
    var age : String = ""
    var phoneNo : String = ""
    var user_image: String! = "image"
    var getImage : String! =  ""
    var fileData: UIImage!
    var height:String! = ""
    var calucalteheight = ""
    var weight: String = ""
    var country_code:String = ""
    var weight_unit:String = ""
    var height_unit:String = ""
    
   
    
    static let shared = ModelProfile()
    
    
    func profileData(Dictionary : NSDictionary){

        print(Dictionary)
        self.address = Dictionary["address"] as! String
        self.first_name = Dictionary["full_name"] as! String
        self.phone_no = Dictionary["phone_no"] as! String
        self.email = Dictionary["email"] as! String
        self.id = Dictionary["id"] as! String
        self.profile_image = Dictionary["profile_image"] as! String
        self.dob = Dictionary["dob"] as! String
        self.gender = Dictionary["gender"] as! String
        self.height = Dictionary["height"] as! String
        self.weight = Dictionary["weight"] as! String
        
        
}
    
    // MARK:- Change Profile
    func changeProfile(completionHAndler: @escaping(Bool,String)->())
    {
        KRProgressHUD.show()
        
        let imagearray = NSMutableArray()
        
        if(fileData != nil)
        {
            imagearray.add( [user_image : fileData!,"key":"profile_image"])
            
        }
        let dictParam = ["user_id" :ModelProfile.shared.id, "full_name":self.fullName, "gender":self.gender, "address" :self.address, "dob" :self.dob, "phone_no" :self.phone_no,"country_code":country_code,"weight_unit":weight_unit,"height_unit":height_unit,"height":height,"weight":weight]
        
        RestApiCall.apiCall_ImageUpload(withImage:utilityObject.KAPIUpdateProfile, withParameter: dictParam as NSDictionary, withImageArray: imagearray as? [Any] )  { (response) in
            
//        RestApiCall.apiCall_ImagePdfUpload(withImage: utilityObject.KAPIUpdateProfile, withParameter: dictParam as NSDictionary, withImageArray: imagearray as? [Any]) { (response) in
            
            KRProgressHUD.dismiss()
            
            if let dict_JSON = response as?NSDictionary{
                if(dict_JSON["status"] as! Bool == true)
                {
                    let dict1 = dict_JSON["data"] as! NSDictionary
                    self.height = dict1["height"] as! String
                    self.weight = dict1["weight"] as! String
                    UtilityClass.setUserDefault(key: self.height, value:"height")
                    UtilityClass.setUserDefault(key: self.weight, value:"weight")
                    
                    UtilityClass.setUserDefault(key: utilityObject.kDefaultUserDetail, value: dict1)
                    ModelProfile.shared.profileData(Dictionary: dict1)
                }else {
                    completionHAndler(dict_JSON["status"] as! Bool, dict_JSON["message"] as! String )
                }
            }
//            #if DEBUG
//            print(dict_JSON)
//            #endif
            
            
          
            
            
        }
        
    }

    // MARK:- Change Profile
    func editProfile(completionHAndler: @escaping(Bool,String)->())
    {
        KRProgressHUD.show()
        
        let imagearray = NSMutableArray()
        
        if(fileData != nil)
        {
            imagearray.add( [user_image : fileData!,"key":"profile_image"])
            
        }
        let dictParam = "id=\(ModelProfile.shared.id)"
        
        
        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.KAPIapiapiapi_profile_edit){
            (response) in
            
            KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            #if DEBUG
            print(dict_JSON)
            #endif
            
            if(dict_JSON["status"] as! Bool == true)
            {
                let dict1 = dict_JSON["data"] as! NSDictionary
                UtilityClass.setUserDefault(key: utilityObject.kDefaultUserDetail, value: dict1)
                ModelProfile.shared.profileData(Dictionary: dict1)
           }
            completionHAndler(dict_JSON["status"] as! Bool, dict_JSON["message"] as! String )
            
            
        }
        
    }



}


