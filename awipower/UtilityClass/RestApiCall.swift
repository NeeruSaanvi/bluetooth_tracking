//
//  RestApiCall.swift
//  MOCSwift
//
//  Created by Piyush Agarwal on 9/22/16.
//  Copyright © 2016 Pinesucceed. All rights reserved.
//


import UIKit
import Alamofire


class RestApiCall: NSObject
{
    
    //    MARK:- apiCall_POST
    class func apiCall_POST(params : String , ApiName : String , completionHandler:@escaping (Any)->())
    {
        #if DEBUG
                print("params is:- ",params)
        #endif
        
        //            let request = NSMutableURLRequest(url: NSURL(string: utilityObject.kBaseUrl + ApiName)! as URL)
        
        let request = NSMutableURLRequest(url: NSURL(string: utilityObject.kBaseUrl + ApiName)! as URL)
         #if DEBUG
                 
                print("Full api is:- ",utilityObject.kBaseUrl + ApiName)
        #endif
        request.timeoutInterval = 50.0
        let headerToken = ["Content-Type" : utilityObject.kAPIauthoKey,"api_token":utilityObject.kAPIKey]
        request.httpMethod = "POST"
        
        request.httpBody = params.data(using:.utf8)
        request.allHTTPHeaderFields = headerToken
        let session = URLSession.shared
        session.dataTask(with: request as URLRequest, completionHandler:
            {
                (data, response, error) in
                #if DEBUG
                            print("error is:-",error ?? "error is nil")
                
//                let str = String(decoding: data! as Data , as: UTF8.self)
//                    print("response from server", str)

               
                #endif
                if error == nil
                {
                    do
                    {
                        let jsonData = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                         #if DEBUG
                        print("Response: \(jsonData)")
                         #endif
                        let dict_JSON = UtilityClass.cleanJsonToObject(data: jsonData as AnyObject)
//                                                        print("Response: \(dict_JSON)")
                        completionHandler(dict_JSON)
                    }
                    catch
                    {
                        //            print("error is:- \(error)")
                        completionHandler(["status":false,"message":"Unable to connect to server, Please try again"])
                    }
                }
                else
                {
                    completionHandler(["status":false,"message":"Unable to connect to server, Please try again"])
                }
        }).resume()
        
    }
    
    //    MARK:- apiCall_GET
    class func apiCall_GET(ApiName:String,completionHandler:@escaping (Any)->())
    {
        
        
//                    print("ApiName api is:- ",ApiName)
        
        let request = NSMutableURLRequest(url: NSURL(string: utilityObject.kBaseUrl + ApiName)! as URL)
        
        //            print("Full api is:- ",utilityObject.kBaseUrl + ApiName)
        
        
        //  let request = NSMutableURLRequest(url: NSURL(string: utilityObject.kBaseApiUrl + ApiName)! as URL)
        //            print("request api is:- ",request)
        
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        
        session.dataTask(with: request as URLRequest, completionHandler:
            
            {
                (data, response, error) in
                //            print("error:-",error ?? "error nil")
                
                if error == nil
                {
                    do
                    {
                        let jsonData = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                        //            print("Response: \(jsonData)")
                        
                        let dict_JSON = UtilityClass.cleanJsonToObject(data: jsonData as AnyObject)
                        //  //            print("Response: \(dict_JSON)")
                        completionHandler(dict_JSON)
                    }
                    catch
                    {
                        //            print("error is:- \(error)")
                        completionHandler(["status":false,"message":"1010"])
                    }
                }
                else
                {
                    completionHandler(["status":false,"message":"1010"])
                }
        }).resume()
        
    }
    
    
    //    MARK:- apiCall_GET
    class func apiCall_GETWithURL(ApiName:String,completionHandler:@escaping (Any)->())
    {
        
         #if DEBUG
                    
        print("Full api is:- ",utilityObject.kBaseUrl + ApiName)
        #endif
        let request = NSMutableURLRequest(url: NSURL(string:   ApiName)! as URL)
         
        //  let request = NSMutableURLRequest(url: NSURL(string: utilityObject.kBaseApiUrl + ApiName)! as URL)
        //            print("request api is:- ",request)
        
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        
        session.dataTask(with: request as URLRequest, completionHandler:
            
            {
                (data, response, error) in
//                            print("error:-",error ?? "error nil")
                
                if error == nil
                {
                    do
                    {
                        let jsonData = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                         #if DEBUG
                                    print("Response: \(jsonData)")
                        #endif
                        let dict_JSON = UtilityClass.cleanJsonToObject(data: jsonData as AnyObject)
                                      print("Response: \(dict_JSON)")
                        completionHandler(dict_JSON)
                    }
                    catch
                    {
                        //            print("error is:- \(error)")
                        completionHandler(["status":false,"message":"Please try again"])
                    }
                }
                else
                {
                    completionHandler(["status":false,"message":"Please try again"])
                }
        }).resume()
        
    }
    
    
    
    //    MARK:- apiCall_POST
    class func apiCall_POSTAlmo(params : Dictionary<String, Any> , ApiName : String , completionHandler:@escaping (Any)->())
    {
//                print("API URL:- ",utilityObject.kBaseUrl + ApiName)
        
        AF.request(utilityObject.kBaseUrl + ApiName, method: .post, parameters: params, encoding: JSONEncoding.default, headers: [:])
            .responseJSON { response in
                do {
                    switch response.result {
                    case .success(let value):
                        //                        print("responseObject: \(value)")
                        
                        let dict_JSON = UtilityClass.cleanJsonToObject(data: value as AnyObject)
                        completionHandler(dict_JSON)
                        
                    case .failure(_):
                        //            print("responseError: \(responseError)")
                        
                        completionHandler(["status":false,"message":"Your request has been failed, Please try again"])
                    }
                }
                
        }
    }
    
    
    class func apiCall_ImageUpload(withImage ApiName: String?, withParameter dicparam: NSDictionary, withImageArray imageArray: [Any]?, withCompletion completionHandler: @escaping (_ response: Any?) -> Void)
        
    {
         #if DEBUG
                print("Full api is:- ",utilityObject.kBaseUrl + ApiName!)
                print("params are-",dicparam)
//                print("image",imageArray)
        #endif
        let url = URL(string: utilityObject.kBaseUrl + ApiName!);
        let request = NSMutableURLRequest(url: url!);
        request.httpMethod = "POST"
        let boundary = "Boundary-\(NSUUID().uuidString)"
       request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let headerToken: HTTPHeaders = ["Content-Type" : utilityObject.kAPIauthoKey,"api_token":utilityObject.kAPIKey]
        //request.allHTTPHeaderFields = headerToken
        //request.setValue(utilityObject.kAPIKey, forHTTPHeaderField: "api_token")
     //   let body = NSMutableData()
      
        request.timeoutInterval = 50.0
        
        AF.upload(
            multipartFormData: { multipartFormData in
                for key in dicparam.allKeys {
                    if let data = (dicparam[key] as! String).data(using: .utf8) {
                        multipartFormData.append(data, withName: key as! String)
                    }
                }
                
                for dic in imageArray! {
                    let dictTemp = dic as! NSDictionary
                    
                    if dictTemp["image"] as? UIImage != nil{
                        
                        
                        let imageData = (dictTemp["image"] as! UIImage).pngData()
                        //(Date())
                        let imagename = "image.png"
                        multipartFormData.append(imageData!, withName: dictTemp["key"] as! String, fileName: imagename, mimeType: "image/png")
                    }
                    
                    //                        if let data = dictTemp["image"].data(using: .utf8) {
                    //                             multipartFormData.append(imageData, withName: "profile", fileName: "image.png", mimeType: "image/png")
                    //                        }
                }
                
                //                    multipartFormData.append(blogData, withName: "blog", fileName: "blog.archive", mimeType: "application/octet-stream")
        },
            to: "\(utilityObject.kBaseUrl)\(ApiName!)",headers:headerToken).responseString { response in
                
                response.result
                    switch response.result {
                    case .success(let value):
                        print("responseObject: \(response.result)")
                        
                        let dict_JSON = UtilityClass.cleanJsonToObject(data: value as AnyObject)
                        completionHandler(dict_JSON)
                        
                    case .failure(_):
                           // print("responseError: \(responseError)")
                        
                        completionHandler(["status":false,"message":"response"])
                    }
                
                
                
//                switch encodingResult.result {
//                case .success(let upload, _, _):
//                    upload
//                        .validate()
//                        //.validate(statusCode: 200..<600)
//                        .responseJSON { response in
//                            do {
//                                switch response.result {
//                                case .success(let value):
//                                    //                                print("responseObject: \(value)")
//
//                                    let dict_JSON = UtilityClass.cleanJsonToObject(data: value as AnyObject)
//                                    completionHandler(dict_JSON)
//
//                                case .failure( _):
//                                    //            print("responseError: \(responseError)")
//
//                                    completionHandler(["status":false,"message":"Please try again"])
//                                }
//                            }
//                    }
//                case .failure( _):
//                    //            print("encodingError: \(encodingError)")
//                    completionHandler(["status":false,"message":"Please try again"])}
        }
        
        
    }
    
    
    
//    // MARK:-IMAGE PDF UPLOAD API CALL
//
//    class func apiCall_ImagePdfUpload(withImage ApiName: String?, withParameter dicparam: NSDictionary, withImageArray imageArray: [Any]?, withCompletion completionHandler: @escaping (_ response: Any?) -> Void)
//
//    {
//
//        AF.upload(
//            multipartFormData: { multipartFormData in
//                for key in dicparam.allKeys {
//                    if let data = (dicparam[key] as! String).data(using: .utf8) {
//                        multipartFormData.append(data, withName: key as! String)
//                    }
//                }
//
//                for dic in imageArray! {
//                    let dictTemp = dic as! NSDictionary
//
//                    for key in dictTemp.allKeys{
//
//                        if key as! String == "image"{
////
////                            if let imageData = (dictTemp["image"] as? UIImage)!.pngData() {
////
////
////                                multipartFormData.append(imageData, withName: dictTemp["key"] as! String, fileName: "imagetest.png", mimeType: "image/png")
////
////                            }
//                        }else if key as! String == "pdf" {
//
//                            if let pdfdata = dictTemp["pdf"] as? URL {
//
//                                let pdfData = try! Data(contentsOf: pdfdata )
//
//                                multipartFormData.append(pdfData, withName: dictTemp["key"] as! String, fileName: "test.pdf", mimeType:"application/pdf")
//
//                            }
//
//
//
//                        }
//
//                    }
//
//
//
//
//
//
//
//
//
//
//
//                    //                        if let data = dictTemp["image"].data(using: .utf8) {
//                    //                             multipartFormData.append(imageData, withName: "profile", fileName: "image.png", mimeType: "image/png")
//                    //                        }
//                }
//
//                //                    multipartFormData.append(blogData, withName: "blog", fileName: "blog.archive", mimeType: "application/octet-stream")
//        },
//            to: "\(utilityObject.kBaseUrl)\(ApiName!)").responseJSON { response in
//
//
//                switch response.result {
//                case .success(let value):
//                    //                        print("responseObject: \(value)")
//
//                    let dict_JSON = UtilityClass.cleanJsonToObject(data: value as AnyObject)
//                    completionHandler(dict_JSON)
//
//                case .failure(_):
//                    //            print("responseError: \(responseError)")
//
//                    completionHandler(["status":false,"message":"Your request has been failed, Please try again"])
//                }
//        }
////
////            encodingCompletion: { encodingResult in
////
////
////                switch encodingResult {
////                case .success(let upload, _, _):
////                    upload
////                        .validate()
////                        //.validate(statusCode: 200..<600)
////                        .responseJSON { response in
////                            do {
////                                switch response.result {
////                                case .success(let value):
////                                    //                                    print("responseObject: \(value)")
////
////                                    let dict_JSON = UtilityClass.cleanJsonToObject(data: value as AnyObject)
////                                    completionHandler(dict_JSON)
////
////                                case .failure( _):
////                                    //            print("responseError: \(responseError)")
////
////                                    completionHandler(["status":false,"message":"Please try again"])
////                                }
////                            }
////                    }
////                case .failure( _):
////                    //            print("encodingError: \(encodingError)")
////                    completionHandler(["status":false,"message":"Please try again"])}
////        })
//
//    }
    
    
    
    //    MARK:- apiCall_POST With URL
    class func apiCall_POSTWithURL(params : Dictionary<String, Any> , url : String , completionHandler:@escaping (Any)->())
    {
             //   URL(string:utilityObject.kBaseUrl + url)!
        #if DEBUG
              print("Full api is:- ", url)
              print("params are-",params)
              #endif
              
        
        AF.request(
URL(string:url)!,method: .post,parameters: params)
            .validate()
            .responseString { (response) -> Void in
                
                do {
                    if(response.error == nil)
                    {
                        if let json = response.value {
                            #if DEBUG
                                  print("Full api is:- ", url)
                                  print("response is-",json)
                                  #endif
                                  
                            
                            completionHandler(json)
                        }
                        else
                        {
                            completionHandler(["status":false,"message":"Please try again"])
                        }
                    }
                    else
                    {
                        completionHandler(["status":false,"message":"Please try again"])
                    }
                }
                
        }
    }
    
    
    
    //    MARK:- apiCall_POST With BASE URL
    class func apiCall_POSTWithBaseURL(params : Dictionary<String, Any> , url : String , completionHandler:@escaping (Any)->())
    {
         #if DEBUG
        print("Full api is:- ",utilityObject.kBaseUrl + url)
        print("params are-",params)
        #endif
        
        AF.request( URL(string:utilityObject.kBaseUrl + url)!, method: .post, parameters: params, encoding: JSONEncoding.prettyPrinted, headers: ["Accept":"*/*"]).responseJSON { (response) in
            switch response.result {
                
            case .success(let json):
                
                //                                 let jsonData = json
                 #if DEBUG
                print("Response of api:- ", json)
                 #endif
                
                let jsonData = UtilityClass.cleanJsonToObject(data: json as AnyObject)
                
                //                completionHandler(["status":true,"data":jsonData])
                
                
                completionHandler(jsonData)
                
            case .failure( _):
                
                completionHandler(["status":false,"message":"Please try again"])
                // completionHandler(error)
            }
        }
        
        
        //        Alamofire.request(
        //            URL(string:utilityObject.kBaseUrl + url)!,
        //            method: .post,
        //            parameters: params, encoding)
        //            .validate()
        //            .responseData{ (response) -> Void in
        //
        //                do {
        //                    if(response.error == nil)
        //                    {
        ////                        let jsonData = String(data: response.data!, encoding: String.Encoding.utf8)
        //                         let jsonData = response.data
        //                        //                print(jsonData ?? "No data")
        //                        completionHandler(jsonData ?? "No data")
        //                    }
        //                }
        //
        //        }
    }
    
    
    
    
    //    MARK:- apiCall_get With BASE URL
    
    class func apiCall_GETWithoutParam(url : String , completionHandler:@escaping (Any)->())
    {
        //        print("Full api is:- ",utilityObject.kBaseUrl + url)
        
        
        AF.request( URL(string:utilityObject.kBaseUrl + url)!, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
                
            case .success(let json):
                //                print("Response of api:- ", json)
                
                //                let jsonData = json
                //                let jsonData = UtilityClass.cleanJsonToObject(data: response.data! as AnyObject)
                completionHandler(json)
                
            case .failure(let error):
                
                completionHandler(["status":false,"message":error])
                // completionHandler(error)
            }
        }
        
        
        
    }
    
    
    
    
    
    class func api_POST(params : NSDictionary, ApiName : String , completionHandler:@escaping (Any)->())
    {
        //            print("params is:- ",params)
        
        do {
            let request = NSMutableURLRequest(url: NSURL(string: utilityObject.kBaseUrl + ApiName)! as URL)
            
            //            print("Full api is:- ",utilityObject.kBaseUrl + ApiName)
            request.timeoutInterval = 50.0
            
            
            let jsondata = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            
            
            
            request.httpMethod = "POST"
            request.httpBody = jsondata
            
            let session = URLSession.shared
            session.dataTask(with: request as URLRequest, completionHandler:
                {
                    (data, response, error) in
                    
                    //            print("error is:-",error ?? "error is nil")
                    
                    if error == nil
                    {
                        do
                        {
                            let jsonData = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                            //            print("Response: \(jsonData)")
                            
                            let dict_JSON = UtilityClass.cleanJsonToObject(data: jsonData as AnyObject)
                            //  //            print("Response: \(dict_JSON)")
                            completionHandler(dict_JSON)
                        }
                        catch
                        {
                            //            print("error is:- \(error)")
                            completionHandler(["status":false,"message":"1010"])
                        }
                    }
                    else
                    {
                        completionHandler(["status":false,"message":"1010"])
                    }
            }).resume()
            
        }
        catch
        {
            
        }
        
    }
    
    
    //    MARK:- apiCall with dynamic types of post
    class func apiCall_DynamicMethod(params : Dictionary<String, Any>,methodType: HTTPMethod, header: HTTPHeaders , url : String , completionHandler:@escaping (Any)->())
    {
        #if DEBUG
        print("Full api is:- ",url)
        print("params are-",params)
        print("method type-",methodType)
        print("Header type-",header)
        #endif
        
        //   URL(string:utilityObject.kBaseUrl + url)!
        AF.request(
            URL(string:url)!,
            method: methodType, parameters: params,encoding: JSONEncoding.default, headers: header)
           .responseJSON { (response) in
                
                do {
                    if(response.error == nil)
                    {
                        if let json = response.value {
                            #if DEBUG
                                   print("Response:- ",json)
                                   #endif
                            
                            completionHandler(json)
                        }
                        else
                        {
                            completionHandler(["status":false,"message":"Please try again"])
                        }
                    }
                    else
                    {
                        print(response.error?.errorDescription as Any)
                        completionHandler(["status":false,"message":response.error?.errorDescription!])
                    }
                }
                
        }
    }
    
    
    
    //MARK: Withheader
    
    class func apiCall_ImagePdfUpload(withImage ApiName: String, withParameter dicparam: NSDictionary, withImageArray imageArray: [Any]?, withCompletion completionHandler: @escaping (_ response: Any?) -> Void)

    {
        
        #if DEBUG
        print("Full api is:- ",utilityObject.kBaseUrl + ApiName)
        print("params is:- ",dicparam)
        #endif
        
        let url = URL(string: utilityObject.kBaseUrl + ApiName);
        let request = NSMutableURLRequest(url: url!);
        request.httpMethod = "POST"
        let boundary = "Boundary-\(NSUUID().uuidString)"
       request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let headerToken = ["Content-Type" : utilityObject.kAPIauthoKey,"api_token":utilityObject.kAPIKey]
        request.allHTTPHeaderFields = headerToken
        //request.setValue(utilityObject.kAPIKey, forHTTPHeaderField: "api_token")
        let body = NSMutableData()
      
        request.timeoutInterval = 50.0
        
  
//        request.httpBody = params.data(using:.utf8)
       
        for dic in imageArray! {
            let dictTemp = dic as! NSDictionary
            
//            body.append(String(format: "\r\n--%@\r\n", boundary).data(using: .utf8)!)
                body.append("--\(boundary)\r\n".data(using: .utf8)!)
//            body.append(NSString(format: "Content-Disposition: form-data; name=\"api_token\"\r\n\r\n" as NSString).data(using: String.Encoding.utf8.rawValue)!)
            
            for key in dictTemp.allKeys{

            if key as! String == "image"{

                let imageData = (dictTemp["image"] as! UIImage).jpegData(compressionQuality: 0.1)

                body.append(String(format:"Content-Disposition: form-data; name=\"\(dictTemp["key"] as! String)\"; filename=\"tempName.png\"\r\n").data(using:.utf8)!)
                body.append(String(format: "Content-Type: image/jpeg\r\n\r\n").data(using: .utf8)!)
                 body.append(imageData!)
                
            }else if key as! String == "pdf" {
                
                if let pdfdata = dictTemp["pdf"] as? URL {

                    let pdfData = try! Data(contentsOf: pdfdata )

                   body.append(String(format:"Content-Disposition: form-data; name=\"\(dictTemp["key"] as! String)\"; filename=\"tempPdfName.pdf\"\r\n").data(using:.utf8)!)
                    body.append(String(format: "Content-Type: image/pdf\r\n\r\n").data(using: .utf8)!)
                    body.append(pdfData)
                  
                }
                }
            }
            
        
        
       // body.append(NSString(format: (UserDefaults.standard.string(forKey: "api_token")! as NSString)).data(using: String.Encoding.utf8.rawValue)!)
        body.append(String(format: "\r\n").data(using: .utf8)!)
        
        
       
//        body.append(String(format: "\r\n--%@\r\n", boundary).data(using: .utf8)!)
        
        }

        for key in dicparam.allKeys
        {
//             body.append(String(format: "\r\n--%@\r\n", boundary).data(using: .utf8)!)
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            
            body.append((dicparam[key] as! String).data(using: .utf8)!)
            body.append("\r\n".data(using: .utf8)!)
      //  body.append(String(format: "\r\n--%@\r\n", boundary).data(using: .utf8)!)
        
      //  body.append(String(format: "Content-Type: application/octet-stream\r\n\r\n").data(using: .utf8)!)
        
//            body.append(String(format: "\r\n--%@\r\n", boundary).data(using: .utf8)!)
        
           // body += "Content-Disposition:form-data; name=\"\(paramName)\""
        }
        
        request.httpBody = body as Data
//        request.allHTTPHeaderFields = headerToken
        request.httpMethod = "POST"
        
        let task =  URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            #if DEBUG
            //                            print("error is:-",error ?? "error is nil")
            #endif
            if error == nil
            {
                do
                {
                     #if DEBUG
                     let str = String(decoding: data!, as: UTF8.self)
                    print(str)
                    #endif
                    let jsonData = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers)
                    #if DEBUG
//                    print("Response: \(jsonData)")
                    #endif
                    let dict_JSON = UtilityClass.cleanJsonToObject(data: jsonData as AnyObject)
                    //                                                       //  print("Response: \(dict_JSON)")
                    completionHandler(dict_JSON)
                }
                catch
                {
                    //            print("error is:- \(error)")
                    completionHandler(["status":false,"message":"Unable to connect to server, Please try again"])
                }
            }
            else
            {
                completionHandler(["status":false,"message":"Unable to connect to server, Please try again"])
            }
        })

        task.resume()
    }
    
    
}

extension Array where Element: Codable {
    
    public var toData: Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public var toJson: String? {
        return toData.toJson
    }
}

extension Data {
    //  Convert NSData to String
    public var toJson : String? {
        return String(data: self, encoding: String.Encoding.utf8)
    }
}



