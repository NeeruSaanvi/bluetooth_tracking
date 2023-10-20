//
//  Model_StaticAPI.swift
//  DDM IOS
//
//  Created by PineSucceed Imac on 19/04/20.
//  Copyright © 2020 PineSucceed MacMini1. All rights reserved.
//

import UIKit

class ModelStaticAPI: NSObject {
    
    var arrayBusinessType = NSArray()
    
    var arrayOfCategory = NSMutableArray()
    
    static let shared = ModelStaticAPI()
    
    func apiCallOnFirstTime()
    {
        self.getBusinessType()
        self.getCategoryType()
    }
    //MARK:- Get Category
    func getCategoryType()
    {
        RestApiCall.apiCall_GET(ApiName: utilityObject.KAPIGetCategory){
            (response) in
            
            let dict_JSON = response as! NSDictionary
            
//            print("\(dict_JSON)")
            
            
            if(dict_JSON["result"] as! Bool == true)
            {
                self.arrayOfCategory = dict_JSON["data"] as! NSArray as! NSMutableArray
            }
            
//            completionHandler(dict_JSON["result"] as! Bool, dict_JSON["message"] as! String)
        }
    }
    
    
    func getBusinessType()
    {
        RestApiCall.apiCall_GET(ApiName: utilityObject.KAPIBusinessType){
            (response) in
            
            let dict_JSON = response as! NSDictionary
            
//            print("\(dict_JSON)")
            
            if(dict_JSON["result"] as! Bool == true)
            {
                self.arrayBusinessType = dict_JSON["data"] as! NSArray
            }
        }
    }
    
}
