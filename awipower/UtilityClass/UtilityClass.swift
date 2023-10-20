//
//  UtilityClass.swift
//  MOCSwift
//
//  Created by Piyush Agarwal on 9/22/16.
//  Copyright © 2016 Pinesucceed. All rights reserved.
//

import UIKit

//var B: String { get }
//
//#defer CFURLGetBaseURL("192.168.1.12:2136/api/ApiService/": CFURL!)
///MARK 

struct utilityObject
{
    #if DEBUG
    static let kBaseUrl = "https://awi.pinesucceed.com/powerpassweb/Auth_Api_Controller/"
        
        //"http://192.168.1.10/awipower/powerpassweb/Auth_Api_Controller/"
        //"http://192.168.1.10/awipower/powerpassweb/Auth_Api_Controller/"
        //http://192.168.1.8/awi_power_pass/Auth_Api_Controller/
        //"               "
        //http://192.168.1.8/awi_power_pass
//    public static final String BASE_URL = "https://awi.pinesucceed.com/powerpassweb/Auth_Api_Controller/";
//    public static final String IMAGE_BASE_URL = "http://awi.pinesucceed.com/powerpassadmin/images/";
//    public static final String TERMS_PAGE_URL = "https://awi.pinesucceed.com/powerpassadmin/views/terms.view.php";
//    public static final String ABOUT_PAGE_URL = "https://awi.pinesucceed.com/powerpassadmin/views/about_us.view.php";
//
    #else
    static let kBaseUrl = "https://awi.pinesucceed.com/powerpassweb/Auth_Api_Controller/"
    #endif
    static let kImageBaseUrl = "http://awi.pinesucceed.com/powerpassadmin/images/"

    static let kAPIKey = "3699da931e12006ab0fafaf97eb2e39fdf6158cbd739c70f32de72d3d01c2acc"
    static let kAPIauthoKey = "application/x-www-form-urlencoded"
    
    static let kAPILogin = "api_user_login"
    
    static let kAPIforget_password = "api_user_reqforgotpass"
    static let kAPISocialLogin = "api_social_sign_up"
    static let kAPIRegistration = "api_user_registration"
    static let KAPIBusinessType = "get_businessType"
    static let KAPIapi_get_calorie = "api_get_calorie"
    static let KAPIapi_api_add_calorie = "api_add_calorie"
    static let KAPIapi_api_update_calorie = "api_update_calorie"
    static let  KAPIUpdateProfile = "api_profile_update"
    static let  KAPIapiaddweight = "api_add_weight"
    static let  KAPIapiapigetweight = "api_get_weight"
    static let  KAPIapiapiapi_profile_edit = "api_profile_edit"
    static let kAPIChangePassword = "api_update_password"
    static let  KAPIapiapiapi_add_weight = "api_add_weight"
    static let KAPIAddProduct = "addproduct"
    static let KAPIGetUsers = "getUsers"
    static let KAPIGetProducts = "getproducts"
    static let KAPICreateMyGetProduct = "get_order_product"
    static let KAPIorder_detail_send_mail = "order_detail_send_mail"
    static let KAPIundeliver_order_delete = "undeliver_order_delete"
    static let KAPIset_price = "set_price"
    
    static let kDefaultDataUpdateToServer =  "dataupdateDate"
    static let kDefaultNotificationToContact =  "notificationSend"
    static let kDefaultConnectedDevicePeripheral =  "connectedDevicePeripheral"
    static let kDefaultConnectedDeviceArray =  "connectedDeviceArray"
    static let kDefaultTempretureUnit =  "tempretureUnit"
    static let kDefaultClockFormat =  "clockFormat"
    static let kDefaultSocialDistance =  "socialDistance"
 
    static let KAPIOrderUnorderList = "get_deliv_undeli_order"
    static let KAPICreateMyOrder = "order_create"
    static let KAPIChangestatus = "change_order_status"
    static let KAPIReturnProduct = "return_order_create"
    static let KAPIDeleteProduct = "product_delete"
    static let KAPIReturnOrderList = "get_return_order"
    static let KAPIGetCategory = "categorytype"
    static let KAPIUpdateProduct = "product_update"
    static let KAPISearchReturnProduct = "api-search-return-product"
    static let KAPIGoogleMap = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial"
    static let KAPIConfirmReturnOrder = "return_order_create"
    static let KAPIGetReturnAmount = "get_return_amount"
    static let KAPIChangePassword = "password_update"
//    static let KAPIGetBuyer = "getbuyer"
    static let KAPIDistancePrice = "distance_price"
    // set default                  distance_price
    static let KAPIChangeProfile = "profileupdate"
    static let kDefaultUserDetail =  "UserDetail"
    static let kDefaultgetproductdetail =  "get_product_detail"
    static let kDefaultpayment_submit =  "payment_submit"
    static let kDefaultget_product_request =  "get_product_request"
    static let kDefaultget_get_order_details =  "get_order_details"
    
    static let kDefaultpurchase_product_list =  "purchase_product_list"
    static let kDefaultget_product_provider =  "get_product_provider"
  
    
    static let kDefaultFcmId =  "fcm"
    static let kDefaultNotificationLastReadCount =  "notificationCount"
 
    
    static let kDefaultReviewCount =  "reviewcount"
    static let kDefaultLastAppVersionForReview =  "lastReviewVersion"
    
    // image
    
    static let kHadepayLogo = UIImage(named: "hpay")
    static let kPlaceholderImage = UIImage(named: "placeholderimage")
    static let kPlaceholderUserImage = UIImage(named: "male-place-holder")
    static let kPlaceholderImageProduct = UIImage(named: "products-pleaceholder")
   

    // color
    static let kCommanColor = (UIColor(red: 119/255, green: 185/255, blue: 251/255, alpha: 1))
    static let kCommanColorHeader = (UIColor(red: 109/255, green: 198/255, blue: 236/255, alpha: 1))
    static let kiPadLableFont = UIFont.init(name: "OpenSans", size: 19)
    static let kiPhoneLableFont = UIFont.init(name: "OpenSans", size: 15)
    static let kCommanColor1 = #colorLiteral(red: 0.9792701602, green: 0.2120947838, blue: 0, alpha: 1)
       // UIColor(red: 95/255, green: 158/255, blue: 244/255, alpha: 1)
    
    
    //MARK: key
    static let linkedInKey = "77zr00p6nfmxxf"
    static let linkedInSecret = "GH5oYx3aBG5qFi09"
    static let googleKey = "791243060396-li939osuki674r9r2gk90isgl0mhj8g1.apps.googleusercontent.com"
    static let kFlipSitterClientId = "7"
    static let kFlipSitterClientSecret = "YxoF7z7a16eI0aP4zPeX5IGBGCdaG7wPnsrxFc1x"
    static let kFlipSitterRedirectUrl = "http://com.pinesucceed.hadepay"
    static let socketURL = "https://node.hadepay.com:3335"
    
    static let kpdfOpenKey = "8FBB1C2F147A6D776555E036A162E4FEF813CFDA5CC8C6C8462D1B58CD3BDD80"
}


class UtilityClass: NSObject
{
    static let kDeviceUUID = UIDevice.current.identifierForVendor!.uuidString
    //    //            print("kDeviceUUID is:-",kDeviceUUID)
    
   class func isIPHONE() -> Bool
    {
        if (UIDevice.current.userInterfaceIdiom  == UIUserInterfaceIdiom.pad)
        {
            return false
        }
        else{
            return true
        }
//        if   UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
//        {
//            return true
//        }
//        return false
    }
    
    //MARK: Get ViewCOntroller From First StoryBorad
    class func getStoryBorad() -> UIStoryboard
    {
        let storyboradName : String = "Main"
        
//        if !UtilityClass.isIPHONE()
//        {
//            storyboradName = "main_iPad"
//        }

        return UIStoryboard.init(name: storyboradName, bundle: nil)
        
    }
    
    
    //MARK: Get ViewCOntroller From First StoryBorad
    func getStoryBoradFromSecond() -> UIStoryboard
    {
        var storyboradName : String = "Main_iphone1"
        
        if !UtilityClass.isIPHONE()
        {
            storyboradName = "main_iPad1"
        }
        
        return UIStoryboard.init(name: storyboradName, bundle: nil)
        
    }
    
    
    
    //MARK: Get ViewCOntroller From First StoryBorad
    func getStoryBoradFromThird() -> UIStoryboard
    {
        var storyboradName : String = "Main_iphone2"
        
        if !UtilityClass.isIPHONE()
        {
            storyboradName = "main_iPad2"
        }
        return UIStoryboard.init(name: storyboradName, bundle: nil)
    }
    
    //MARK: SAFE VALUE IN UserDefault
    //    class func saveUserDefault(key: String , value : Any)
    //    {
    //       let x = UserDefaults.standard.set(value, forKey: key)
    //
    //        //            print("value of x", x)
    //    }
    class func setUserDefault(key: String , value : Any?)
    {
        UserDefaults.standard.set(value, forKey: key)
        
        //        //            print("value of x", x)
    }
    
    
    
    //MARK: GET VALUE FROM UserDefault
    class func getUserDefault(key: String) -> Any?
    {
        return UserDefaults.standard.object(forKey: key)
    }
    
    func checkUserDefault(key: String) -> Bool
    {
        let userDefaults  = UserDefaults.standard
        
        if userDefaults.object(forKey: key) != nil
        {
            return true
        }
        
        return false
        
        //        let flag = UserDefaults.standard.objectIsForced(forKey: key)
        //        //            print(flag)
        //
        //        return flag
    }
    

    
    static func cleanJsonToObject(data : AnyObject) -> AnyObject{
        

        let jsonObjective : Any = data





        if jsonObjective is NSArray {

            //            let array : NSMutableArray = (jsonObjective as AnyObject) as! NSMutableArray

            let jsonResult : NSArray = (jsonObjective as? NSArray)!



            let array: NSMutableArray = NSMutableArray(array: jsonResult)



            //            for (int i = (int)array.count-1; i >= 0; i--)
            for  i in stride(from: array.count-1, through: 0, by: -1)
            {
                let a : AnyObject = array[i] as AnyObject;

                if a as! NSObject == NSNull(){
                    array.removeObject(at: i)

                } else {
                    array[i] = UtilityClass.cleanJsonToObject(data: a)

                    //                        [self cleanJsonToObject:a];
                }
            }
            return array;
        } else
            if jsonObjective is NSDictionary  {

                let jsonResult : Dictionary = (jsonObjective as? Dictionary<String, AnyObject>)!



                let dictionary: NSMutableDictionary = NSMutableDictionary(dictionary: jsonResult)

                //            let dictionary : NSMutableDictionary = (jsonResult as? NSMutableDictionary<String, AnyObject>)!

                for  key in dictionary.allKeys {

                    let  d : AnyObject = dictionary[key as! NSCopying]! as AnyObject

                    if d as! NSObject == NSNull()
                    {
                        dictionary[key as! NSCopying] = ""
                    }
                    else
                    {
                        dictionary[key as! NSCopying] = UtilityClass.cleanJsonToObject(data: d )
                    }
                }
                return dictionary;
            }
            else {
                return jsonObjective as AnyObject;
        }
        
        
        //        return data
    }

    
    
    
    /// calculate height of string
    static func height(constraintedWidth width: CGFloat, font: UIFont, text: String) -> CGFloat {
        
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = text
        label.font = font
        label.sizeToFit()

        return label.frame.height
        
        //        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        //        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: font as! UIFont, context: nil)
        //
        //        return ceil(boundingBox.height)
        
    }

}

