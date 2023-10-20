//
//  MyDataVC.swift
//  awipower
//
//  Created by Srajan on 06/11/20.
//

import UIKit
import KRProgressHUD
class mydatacelllist: UITableViewCell{
    
    @IBOutlet weak var minkcallbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var burn_lbl: UILabel!
}
class MyDataVC: BaseClassController {
    @IBOutlet weak var tbt:UITableView!
    @IBOutlet weak var view1:UIView!
    let getdata = Caloriesmodel()
    var exercise_time = "0.0"
    

    @IBOutlet weak var totalkcal_text: UILabel!
    @IBOutlet weak var totaltimelbl: UILabel!
    @IBOutlet weak var totla_time_text: UILabel!
    
    var pageIndex = 0
    override func viewDidLoad() {
        addSlideMenuButton()
        super.viewDidLoad()
        
        
        
        self.navigationItem.title = "Data History"

        getDataSource()
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
      
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
            print("Avimin\(timecalculte)")
        }else if hr >= 60 {
        timecalculte = String(hr)
        hourandseodsunit = "Hr"
        print("Avihr\(timecalculte)")
        }
        exercise_time = timecalculte + hourandseodsunit
      return (hr, min, 60 * secf)
    }
    
    func getDataSource(){
        getdata.Caloriesget { (success,message) in
            if success {
                KRProgressHUD.show()
                DispatchQueue.main.async {
                    if let dict = self.getdata.datacalories[0] as? NSDictionary{
                        self.totla_time_text.text! = "\(self.getdata.datacalories.count)"
                        self.totaltimelbl.text = self.getdata.exercise_time
                        let value:Float = Float(self.getdata.totalCaloriescount) ?? 0.0
                        self.totalkcal_text.text =  String(format: "%.2f",Float(value))
                    }
                    self.tbt.reloadData()
                }
                
            }else {
                KRProgressHUD.showMessage(message)
            }
            KRProgressHUD.dismiss()
        }
    }
    
}
extension MyDataVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getdata.datacalories.count
//        tbt.roundCorners(corners: [.topLeft,.topRight], radius: <#T##CGFloat#>)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var totalSeconds = 0
        var totalCalories = 0.0
        var unittime = ""
        var calorieUnit = " cal"
        let cell = tbt.dequeueReusableCell(withIdentifier:"mydatacelllist") as! mydatacelllist
        let dict = getdata.datacalories[indexPath.row] as! NSDictionary
//        let date2 = modelgetdata["updated"] as! String
      
        cell.burn_lbl.text = dict ["mode"] as? String
        let date2 = dict["updated"] as! String
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date3 = dateFormatter1.date (from: date2)
        dateFormatter1.dateFormat = "dd-MM-yyyy HH:mm"
        let result2 = dateFormatter1.string(from: date3!)
        cell.datelbl.text = result2
        let exercise_time = dict["exercise_time"] as? String ?? "0.0"
        totalCalories = Double(dict["calorie_value"] as? String ?? "0.0") ?? 0.0
        
        totalSeconds = (Int(exercise_time) ?? 0)
        let minute = totalSeconds/60
        let sconds  = Int(totalSeconds) % 60
        if totalCalories >= 1000.0{
            calorieUnit = " kcal"
        }
        if minute == 0{
            unittime = "sec"
            cell.minkcallbl.text =   String(minute) + ":" + String(sconds) + unittime + "/" + "\(totalCalories)" + calorieUnit
        }else {
            unittime = "min"
            cell.minkcallbl.text =   String(minute) + ":" + String(sconds) + unittime + " / " + "\(totalCalories)" + calorieUnit
        }
        
       
        
        
     
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = getdata.datacalories[indexPath.row] as! NSDictionary
        let abdomen_value = model["abdomen_value"] as? String
        let arm_value = model["arm_value"] as? String
        let calorie_value = model["calorie_value"] as? String
        let chest_value  = model["chest_value"] as? String
        let created = model["created"] as? String
        let exercise_time = model["exercise_time"] as? String
        let feed_back = model["feed_back"] as? String
        let frequency  = model["frequency"] as? String
        let gluts_value = model["gluts_value"] as? String
        let middle_back_value = model["middle_back_value"] as? String
        let mode = model["mode"] as? String
        let pause_time  = model["pause_time"] as? String
        let pulse_time = model["pulse_time"] as? String
        let pulse_width = model["pulse_width"] as? String
        let ramp_down = model["ramp_down"] as? String
        let ramp_up  = model["ramp_up"] as? String
        let reps  = model["reps"] as? String
        let shoulder_value = model["shoulder_value"] as? String
        let time = model["time"] as? String
        let updated = model["updated"] as? String
        let waist_value  = model["waist_value"] as? String
        let working_time = model["working_time"] as? String
        let leg_value = model["leg_value"] as? String
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"MyDataDetailsVC") as! MyDataDetailsVC
        vc.abdomen_value = abdomen_value!
        vc.arm_value = arm_value!
        vc.calorie_value = calorie_value!
        vc.chest_value = chest_value!
        vc.created = created!
        vc.exercise_time1 = exercise_time!
        vc.frequency = frequency!
        vc.gluts_value = gluts_value!
        vc.feed_back = feed_back!
        vc.middle_back_value = middle_back_value!
        vc.mode = mode!
        vc.pause_time = pause_time!
        vc.pulse_time = pulse_time!
        vc.pulse_width = pulse_width!
        vc.ramp_down = ramp_down!
        vc.frequency = frequency!
        vc.gluts_value = gluts_value!
        vc.pause_time = pause_time!
        vc.pulse_time = pulse_time!
        vc.pulse_width = pulse_width!
        vc.ramp_up = ramp_up!
        vc.reps = reps!
        vc.shoulder_value = shoulder_value!
        vc.time = time!
        vc.updated = updated!
        vc.waist_value = waist_value!
        vc.shoulder_value = shoulder_value!
        vc.working_time = working_time!
        vc.leg_value =  leg_value!
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == getdata.datacalories.count {
                pageIndex = pageIndex + 1
                getdata.pageindex = "\(pageIndex)"
                getDataSource()
            }
    }
    
    @objc func btnClick(sender: UIButton)
    {
//        let index = sender.tag / 100000
//        let section = sender.tag % 100000
    }
}
