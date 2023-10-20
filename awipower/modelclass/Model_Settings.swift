//
//  Model_Settings.swift
//  247Vitals
//
//  Created by PineSucceed MacMini1 on 30/04/20.
//  Copyright © 2020 PineSucceed. All rights reserved.
//

import UIKit
class Model_Settings: NSObject {
    
    var currentPassord : String = ""
    var newPassword : String = ""
    var userId : String = ""
    var deviceid : String = "asdasdasdasdasdas"
    var deviceType : String = "ios"
    var fullName : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var workingAt : String = ""
    var emailId : String = ""
    var age : String = ""
    var address : String = ""
    var gender : String = ""
    var phoneNo : String = ""
     var dob : String = ""
    var user_image: String! = "image"
    var getImage : String! =  ""
    var fileData: UIImage!
    
    
    //MARK:- Change Password
    
    func changePassword(completionHAndler: @escaping(Bool,String)->())
    {
     
        let dictParam =  "newpassword=\(newPassword)&newpassword=\(currentPassord)&id=\(ModelProfile.shared.id)&deviceType=\("IOS")"

        
          RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.kAPIChangePassword)
          {
            (response) in
        
            let dict_JSON = response as! NSDictionary
            
            if(dict_JSON["status"] as! Bool == true)
            {
                
            }
            
            completionHAndler(dict_JSON["status"] as! Bool, dict_JSON["message"] as! String )
            
            
            
        }
        
    }
    
//    //MARK:- Update Profile
//    func updateProfile(completionHandler: @escaping(Bool, String)->())
//    {
//        SVProgressHUD.show(withStatus: "Please Wait...")
//
//        let dictParam = "userId=\(Model_Profile.shared.userId)&fname=\(Model_Profile.shared.fullName)&lname=\(Model_Profile.shared.fullName)&age=\(Model_Profile.shared.age)&gender=(male)&address=(28,jamayka,paris,newyork)&dob=(25-5-2020)&registration_no=\(Model_Profile.shared.registration_no)&phone_no=\(8432247011)&profile_image=()"
//        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.KAPIUpdateProfile)
//        {
//            (response) in
//
//            SVProgressHUD.dismiss()
//             let dict_JSON = response as! NSDictionary
//            if(dict_JSON["status"] as! Bool == true)
//            {
//                print("updated")
//            }
//            completionHandler(dict_JSON["status"] as! Bool, dict_JSON["message"] as! String)
//        }
//    }
    
    

}
//yourString.toImage() // it will convert String  to UIImage
//
extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            #if DEBUG
            print("\(data)")
            #endif
            return UIImage(data: data)
        }
        return nil
    }
}
//}
