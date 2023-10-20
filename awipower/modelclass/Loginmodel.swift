//
//  Loginmodel.swift
//  awipower
//
//  Created by Srajan on 02/11/20.
//

import Foundation
import KRProgressHUD

import Toast_Swift
class Loginmodel: NSObject {
    
    var email: String = ""
    var password: String = ""
    var socialId: String = ""
    var full_name: String = ""
    let devicetoken = UserDefaults.standard.string(forKey: "device_id")
    func login(completionHandler:@escaping (Bool, String)->())
    {
    
        let dictParam = "email=\(email)&password=\(password)&device_type=\("IOS")&deviceid=\(devicetoken!)"
          KRProgressHUD.show()
        //self.navigationController?.view.makeToast("Please wait...")

        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.kAPILogin){
            (response) in
            KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(dict_JSON)")
            
            if(dict_JSON["status"] as? Bool == true)
            {
                let dict1 = dict_JSON["data"] as! NSDictionary
             print(dict1)
             //   let dict2 = dict1[0] as! NSDictionary
                UtilityClass.setUserDefault(key: utilityObject.kDefaultUserDetail, value: dict1)
                ModelProfile.shared.profileData(Dictionary: dict1)
           }
            completionHandler((dict_JSON["status"] as? Bool)  ?? false ,dict_JSON["message"] as? String ?? "")
            
        }
    }

    func socialLogin( completionHandler:@escaping (Bool, String)->())
    {
           KRProgressHUD.show()

        
        let dictParam = "email=\(email)&socialLoginId=\(socialId)&device_type=\("IOS")&deviceid=\(devicetoken!)&full_name=\(full_name)"
        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.kAPISocialLogin){
            (response) in
            
            KRProgressHUD.dismiss()
            
            if let dict_JSON = response as? NSDictionary{
            print("the response is\(response)")
            if(dict_JSON["status"] as? Bool == true)
            {
                let dict1 = dict_JSON["data"] as! NSDictionary
//                let dict2 = dict1[0] as! NSDictionary
                UtilityClass.setUserDefault(key: utilityObject.kDefaultUserDetail, value: dict1)
               // ModelProfile.shared.profileData(Dictionary: dict2)
            }
                completionHandler(dict_JSON["status"] as? Bool ?? (0 != 0)  ,dict_JSON["message"] as? String ?? "")
            }
            
            
        }
    }
    

}

class ModelForgetPassword: NSObject {
    
    var email = ""
    
    
    func ModelForgetPasswordget(completionHandler:@escaping (Bool, String)->())
    {
        let dictParam = "email=\(email)"
        //SVProgressHUD.show(withStatus: "Please wait...")
        //self.navigationController?.view.makeToast("Please wait...")

        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.kAPIforget_password){  (response) in
            
            KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(response)")
//            if(dict_JSON["result"] as! Bool == true)
//            {
//                let dict1 = dict_JSON["data"] as! NSArray
//                let dict2 = dict1[0] as! NSDictionary
//                UtilityClass.setUserDefault(key: utilityObject.kDefaultUserDetail, value: dict2)
//                ModelProfile.shared.profileData(Dictionary: dict2)
//            }
            completionHandler(dict_JSON["status"] as? Bool ?? (0 != 0),dict_JSON["message"] as? String ?? "")
            
        }
    }
    
}
