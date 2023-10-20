//
//  CaloriesburnVC.swift
//  awipower
//
//  Created by Srajan on 03/11/20.
//

import UIKit

class calorieslistcell: UITableViewCell{
    @IBOutlet var calorieslbl:UILabel!
    @IBOutlet var calorieslbl1:UILabel!
    
    @IBOutlet weak var selectbtn: UIButton!
    @IBOutlet var datelbl:UILabel!
    @IBOutlet weak var datelbshowl: UILabel!
}
class CaloriesburnVC: BaseClassController{
    
    let calories = Caloriesmodel()
    var date = ""
    var value = ""
    @IBOutlet weak var tbt: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSlideMenuButton()
        tbt.tableFooterView = UIView()
        self.navigationItem.title = "Calories"
    }
    override func viewWillAppear(_ animated: Bool) {
        calories.Caloriesget{(success,message)in
            if success{
                DispatchQueue.main.async {
                    if let dict = self.calories.datacalories[0] as? NSDictionary {
                        let date2 = dict["updated"] as! String
                        let dateFormatter1 = DateFormatter()
                        dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        let date3 = dateFormatter1.date (from: date2)
                        dateFormatter1.dateFormat = "dd-MM-yyyy HH:mm"
                        let result2 = dateFormatter1.string(from: date3!)
                         self.date = "\(result2)"
                        let calovalove = (dict["calorie_value"] as? String ?? "0.0")!
                        let caloresvalue:Float =  Float(calovalove) ?? 0.0
                        self.value = String(format: "%.2f",Float(caloresvalue))
                        
                    }
                    self.tbt.reloadData()
                }
            }else {
                
            }
            
        }
    }
   

}

extension CaloriesburnVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
               
        } else {
//            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
                //calories.datacalories.count
            if calories.datacalories.count == 0 {
               
//                label.center = CGPoint(x: 200, y:400)
//                label.textAlignment = .center
//                label.text = "No Data Found"
//                label.isHidden = false
//                self.view.addSubview(label)
                }else {
                   // label.isHidden = true
                    return self.calories.datacalories.count
            }
              
        }
        return 0
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let caloriescell = tbt.dequeueReusableCell(withIdentifier:"calorieslistcell1") as! calorieslistcell
            caloriescell.calorieslbl.text! = value
            caloriescell.datelbshowl.text! =   self.date
            return caloriescell
        }else {
            let caloriescell = tbt.dequeueReusableCell(withIdentifier:"calorieslistcell") as! calorieslistcell
            let model = calories.datacalories[indexPath.row] as! NSDictionary
            caloriescell.selectbtn.addTarget(self, action:#selector(select_btn), for: .touchUpInside)
            caloriescell.selectbtn.tag = indexPath.row
            let caloresvalue:Float =  Float(model["calorie_value"] as? String ?? "0.0") ?? 0.0
            caloriescell.calorieslbl1.text! = String(format: "%.2f",Float(caloresvalue))
            let date2 = model["updated"] as! String
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date3 = dateFormatter1.date (from: date2)
            dateFormatter1.dateFormat = "dd-MM-yyyy HH:mm"
            let result2 = dateFormatter1.string(from: date3!)
            caloriescell.datelbl.text! = result2
            return caloriescell
        }
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 284
        } else {
            return 85
        }
     
    }
    
    @objc func select_btn(sender:UIButton){
        let model = calories.datacalories[sender.tag] as! NSDictionary
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
    
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//        }else {
//            let model = calories.datacalories[indexPath.row] as! NSDictionary
//            let abdomen_value = model["abdomen_value"] as? String
//            let arm_value = model["arm_value"] as? String
//            let calorie_value = model["calorie_value"] as? String
//            let chest_value  = model["calorie_value"] as? String
//            let created = model["created"] as? String
//            let exercise_time = model["exercise_time"] as? String
//            let feed_back = model["feed_back"] as? String
//            let frequency  = model["frequency"] as? String
//            let gluts_value = model["gluts_value"] as? String
//            let middle_back_value = model["middle_back_value"] as? String
//            let mode = model["mode"] as? String
//            let pause_time  = model["pause_time"] as? String
//            let pulse_time = model["pulse_time"] as? String
//            let pulse_width = model["pulse_width"] as? String
//            let ramp_down = model["ramp_down"] as? String
//            let ramp_up  = model["ramp_up"] as? String
//            let reps  = model["reps"] as? String
//            let shoulder_value = model["shoulder_value"] as? String
//            let time = model["time"] as? String
//            let updated = model["updated"] as? String
//            let waist_value  = model["waist_value"] as? String
//            let working_time = model["working_time"] as? String
//            let leg_value = model["leg_value"] as? String
//
//            let vc = self.storyboard?.instantiateViewController(withIdentifier:"MyDataDetailsVC") as! MyDataDetailsVC
//            vc.abdomen_value = abdomen_value!
//            vc.arm_value = arm_value!
//            vc.calorie_value = calorie_value!
//            vc.chest_value = chest_value!
//            vc.created = created!
//            vc.exercise_time1 = exercise_time!
//            vc.frequency = frequency!
//            vc.gluts_value = gluts_value!
//            vc.feed_back = feed_back!
//            vc.middle_back_value = middle_back_value!
//            vc.mode = mode!
//            vc.pause_time = pause_time!
//            vc.pulse_time = pulse_time!
//            vc.pulse_width = pulse_width!
//            vc.ramp_down = ramp_down!
//            vc.frequency = frequency!
//            vc.gluts_value = gluts_value!
//            vc.pause_time = pause_time!
//            vc.pulse_time = pulse_time!
//            vc.pulse_width = pulse_width!
//            vc.ramp_up = ramp_up!
//            vc.reps = reps!
//            vc.shoulder_value = shoulder_value!
//            vc.time = time!
//            vc.updated = updated!
//            vc.waist_value = waist_value!
//            vc.shoulder_value = shoulder_value!
//            vc.working_time = working_time!
//            vc.leg_value =  leg_value!
//            self.navigationController?.pushViewController(vc, animated:true)
//
//
//        }
//
//    }

}
