//
//  File.swift
//  awipower
//
//  Created by Srajan on 03/11/20.
//

import Foundation
import KRProgressHUD
class registermodel: NSObject{
    var name:String = ""
    var email:String = ""
    var password:String = ""
    var deviceid:String = ""
    var device_type:String = ""
    var addheight:String  = ""
    var addwedight:String  = ""
    var height_unit:String = ""
    var weight_unit:String = ""
    
    let devicetoken = UserDefaults.standard.string(forKey: "device_id")
    func register_up(completionHandler:@escaping (Bool, String)->())
    {
        
        let dictParam = "email=\(email)&full_name=\(name)&device_type=\("IOS")&deviceid=\(devicetoken!)&password=\(password)&height=\(addheight)&weight=\(addwedight)&height_unit=\(height_unit)&weight_unit=\(weight_unit)"
      //  SVProgressHUD.show(withStatus: "Please wait...")
        KRProgressHUD.show()

        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.kAPIRegistration){
            (response) in
            KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(dict_JSON)")
            KRProgressHUD.showMessage("Thank you for registration, Please verify your email address.")
            if(dict_JSON["status"] as! Bool == true)
            {
//                let dict1 = dict_JSON["data"] as! NSDictionary
          //   print(dict1)
//                let dict2 = dict1[0] as! NSDictionary
                //UtilityClass.setUserDefault(key: utilityObject.kDefaultUserDetail, value: dict1)
              //  ModelProfile.shared.profileData(Dictionary: dict2)
                
           }
            completionHandler((dict_JSON["status"] as? Bool)! ,dict_JSON["message"] as! String)
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
