//
//  WeightModel.swift
//  awipower
//
//  Created by Srajan on 17/11/20.
//

import Foundation
import KRProgressHUD
class WeightgetModel :NSObject{
    var user_id: String = ""
    var page: String = ""
    var dataWeight = NSMutableArray()
    var caloressdata: String!
    var value = ""
    var weight_unit = ""
    
    func Weightgetadd(completionHandler:@escaping (Bool, String)->())
    {
        
        let dictParam = "user_id=\(ModelProfile.shared.id)&page=\("0")"
        KRProgressHUD.show()
        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.KAPIapiapigetweight){ [self]
            (response) in
            KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(dict_JSON)")
            
            if(dict_JSON["status"] as? Bool == true)
            {
                self.dataWeight = dict_JSON["data"] as! NSMutableArray

           }
            
            completionHandler((dict_JSON["status"] as? Bool ?? false)! ,dict_JSON["message"] as? String ?? "")
            
        }
    }
    
    
    
    func Weightadd_api(completionHandler:@escaping (Bool, String)->())
    {
        let dictParam = "user_id=\(ModelProfile.shared.id)&value=\(value)&weight_unit=\(weight_unit)"
        KRProgressHUD.show()
        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.KAPIapiapiapi_add_weight){
            (response) in
            KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(dict_JSON)")
            let message = dict_JSON["message"] as! String
            
            if(dict_JSON["status"] as? Bool == true)
            {
                Comman.alertView(title: "Awi", message:message, object:self, cancelTitle:"Ok")
               // self.dataWeight = dict_JSON["data"] as! NSMutableArray

           }
            
            completionHandler((dict_JSON["status"] as? Bool ?? false)! ,dict_JSON["message"] as? String ?? "")
            
        }
    
        
    }
       
    
    
    
    
    
    
    
    
}
