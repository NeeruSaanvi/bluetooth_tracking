//
//  Caloriesmodel.swift
//  awipower
//
//  Created by Srajan on 03/11/20.
//

import Foundation
import KRProgressHUD
class Caloriesmodel :NSObject{
    var user_id: String = ""
    var page: String = ""
    var datacalories = NSMutableArray()
    var caloressdata: String!
    var exercise_time: String = "0.0"
    var totalCaloriescount:String = "0.0"
    var pageindex = "0"
    var mode : String = "0.0"
    var calorie_value : String = "0.0"
    var pulse_time : String = "0.0"
    var pause_time : String = "0.0"
    var working_time : String = "0.0"
    var frequency : String = "0.0"
    var pulse_width : String = "0.0"
    var ramp_down : String = "0.0"
    var ramp_up : String = "0.0"
    var arm_value : String = "0.0"
    var chest_value : String = "0.0"
    var shoulder_value : String = "0.0"
    var gluts_value : String = "0.0"
    var abdomen_value : String = "0.0"
    var leg_value : String = "0.0"
    var middle_back_value : String = "0.0"
    var waist_value : String = "0.0"
    var calorie_id: String = "0"
    var datacaloriesadd = NSMutableArray()
    
    func Caloriesget(completionHandler:@escaping (Bool, String)->())
    {
        let dictParam = "user_id=\(ModelProfile.shared.id)&page=\(pageindex)"
        KRProgressHUD.show()

        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.KAPIapi_get_calorie){
            (response) in
            KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(dict_JSON)")
            var totalSeconds = 0.0
            var totalCalories = 0.0
            var calorieUnit = "cal"
            if(dict_JSON["status"] as? Bool == true)
            {
//                if dict_JSON ["data"] as nsarry
             self.datacalories = dict_JSON["data"] as! NSMutableArray
                let completedata = self.datacalories as? [[String:Any]]
                for dict in completedata! {
                   let exercise_time = dict["exercise_time"] as? String ?? "0"
                    totalSeconds += Double(Int(exercise_time) ?? Int(0.0))
                    let caloreiscount = dict["calorie_value"] as? String ?? "0.0"
                    totalCalories += Double(caloreiscount) ?? 0.0
                }
                
                if totalCalories >= 1000.0{
                    calorieUnit = "kcal"
                }
                self.totalCaloriescount = String(totalCalories) + calorieUnit
                
                self.secondsToHoursMinutesSeconds(seconds: totalSeconds)
                
        
                
                
         //
           }
            completionHandler((dict_JSON["status"] as? Bool ?? false)! ,dict_JSON["message"] as? String ?? "")
            
        }
    }
    
    
    
    func secondsToHoursMinutesSeconds (seconds : Double) -> (Double, Double, Double) {
      let (hr,  minf) = modf (seconds / 3600)
      let (min, secf) = modf (60 * minf)
       print("\(min)","\(hr)")
        var hourandseodsunit = ""
        var timecalculte = ""
        if min < 59 {
            timecalculte = String(min)
            hourandseodsunit = "min"
            print("min\(timecalculte)")
        }else if hr >= 60 {
        timecalculte = String(hr)
        hourandseodsunit = "Hr"
        print("hr\(timecalculte)")
        }
        exercise_time = timecalculte + hourandseodsunit
      return (hr, min, 60 * secf)
    }
    
    
    func Caloriesadd(completionHandler:@escaping (Bool, String)->())
    {
      
       
        let dictParam = "user_id=\(ModelProfile.shared.id)&mode=\(mode)&exercise_time=\(exercise_time)&calorie_value=\(calorie_value)&pulse_time=\(pulse_time)&pause_time=\(pause_time)&working_time=\(working_time)&frequency=\(frequency)&pulse_width=\(pulse_width)&ramp_down=\(ramp_down)&ramp_up=\(ramp_up)&arm_value=\(arm_value)&chest_value=\(chest_value)&shoulder_value=\(shoulder_value)&gluts_value=\(gluts_value)&abdomen_value=\(abdomen_value)&leg_value=\(leg_value)&middle_back_value=\(middle_back_value)&waist_value=\(waist_value)"
          print(dictParam)
      //  KRProgressHUD.show()

        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.KAPIapi_api_add_calorie){
            (response) in
          //  KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(dict_JSON)")
         
            if(dict_JSON["status"] as? Bool == true)
            {
//                if dict_JSON ["data"] as nsarry
              self.datacaloriesadd = dict_JSON["data"] as! NSMutableArray
                let completedata = self.datacaloriesadd as? [[String:Any]]
                for dict in completedata! {
                    let id  = dict ["id"] as? NSNumber ??  0
                    self.calorie_id = "\(id)"
                    
                    print(self.calorie_id)

                }
                
               
        
                
                
         //
           }
            completionHandler((dict_JSON["status"] as? Bool ?? false)! ,dict_JSON["message"] as? String ?? "")
            
        }
    }
    
    func Caloriesupdate(completionHandler:@escaping (Bool, String)->())
    {
      
       
        let dictParam = "user_id=\(ModelProfile.shared.id)&mode=\(mode)&exercise_time=\(exercise_time)&calorie_value=\(calorie_value)&pulse_time=\(pulse_time)&pause_time=\(pause_time)&working_time=\(working_time)&frequency=\(frequency)&pulse_width=\(pulse_width)&ramp_down=\(ramp_down)&ramp_up=\(ramp_up)&arm_value=\(arm_value)&chest_value=\(chest_value)&shoulder_value=\(shoulder_value)&gluts_value=\(gluts_value)&abdomen_value=\(abdomen_value)&leg_value=\(leg_value)&middle_back_value=\(middle_back_value)&waist_value=\(waist_value)&calorie_id=\(calorie_id)"
        //KRProgressHUD.show()

        
        RestApiCall.apiCall_POST(params: dictParam, ApiName: utilityObject.KAPIapi_api_update_calorie){
            (response) in
           // KRProgressHUD.dismiss()
            
            let dict_JSON = response as! NSDictionary
            print("the response is\(dict_JSON)")
         
            if(dict_JSON["status"] as? Bool == true)
            {
//                if dict_JSON ["data"] as nsarry
              self.datacaloriesadd = dict_JSON["data"] as! NSMutableArray
                let completedata = self.datacalories as? [[String:Any]]
                for dict in completedata! {
                    

                }
                
               
        
                
                
         //
           }
            completionHandler((dict_JSON["status"] as? Bool ?? false)! ,dict_JSON["message"] as? String ?? "")
            
        }
    }
    
    
    
    
    
    
    
    
}
