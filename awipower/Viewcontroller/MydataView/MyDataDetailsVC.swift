//
//  MyDataDetailsVC.swift
//  awipower
//
//  Created by Srajan on 12/11/20.
//

import UIKit

class MyDataDetailsVC: BaseClassController{

    @IBOutlet weak var calorie_value_lbl: UILabel!
    @IBOutlet weak var modelbl_txt: UILabel!
    @IBOutlet weak var unknowlbl1: UILabel!
    @IBOutlet weak var exercise_time: UILabel!
    @IBOutlet weak var chest_lbl: UILabel!
    @IBOutlet weak var waist_lbl: UILabel!
    @IBOutlet weak var adbomen: UILabel!
    @IBOutlet weak var middel_lbl:UILabel!
    @IBOutlet weak var shoulder_lbl: UILabel!
    @IBOutlet weak var paulsefall: UILabel!
    @IBOutlet weak var paulse_rise_lbl: UILabel!
    @IBOutlet weak var paulse_width_lbl: UILabel!
    @IBOutlet weak var frequnecy_lbl: UILabel!
    @IBOutlet weak var palules_time_second: UILabel!
    @IBOutlet weak var paulse_time: UILabel!
    @IBOutlet weak var leg_lbl: UILabel!
    @IBOutlet weak var glutes_lbl: UILabel!
    @IBOutlet weak var arma_lbl: UILabel!
    
    
    var abdomen_value = ""
    var arm_value = ""
    var calorie_value = "0.0"
    var chest_value = ""
    var created = ""
    var exercise_time1 = ""
    var feed_back = ""
    var frequency  = ""
    var gluts_value = ""
    var middle_back_value = ""
    var mode = ""
    var pause_time = ""
    var pulse_time = ""
    var pulse_width = ""
    var ramp_down = ""
    var ramp_up = ""
    var reps = ""
    var shoulder_value = ""
    var time = ""
    var updated = ""
    var waist_value  = ""
    var working_time = ""
    var leg_value = ""
    var calorieUnit = "cal"
    var unittime = ""
    var totalSeconds = Int()
    var pageindex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       addBackButton()
        self.navigationItem.title = "Calories Information"
        showdata_all_field()
    }
    
    
    func showdata_all_field(){
        if Double(calorie_value) ?? 0.0 >= 1000.0{
            calorieUnit = " kcal"
        }
        calorie_value_lbl.text! = calorie_value + calorieUnit
        modelbl_txt.text! = mode
        unknowlbl1.text! = "0"
        totalSeconds = (Int(exercise_time1) ?? 0)
        let minute = totalSeconds/60
        let sconds  = Int(totalSeconds) % 60
        if minute == 0{
            unittime = "sec"
            exercise_time.text! =   String(minute) + ":" + String(sconds) + unittime
        }else {
            unittime = "min"
            exercise_time.text! =   String(minute) + ":" + String(sconds) + unittime
        }
        chest_lbl.text! = chest_value
        waist_lbl.text! = waist_value
        adbomen.text! = abdomen_value
        middel_lbl.text! = middle_back_value
        shoulder_lbl.text = shoulder_value
        paulsefall.text = pulse_time
        paulse_rise_lbl.text = pulse_time
        paulse_width_lbl.text = pulse_width
        frequnecy_lbl.text = frequency
        palules_time_second.text = pulse_time
        paulse_time.text = pulse_time
        leg_lbl.text = leg_value
        glutes_lbl.text = gluts_value
        arma_lbl.text = arm_value
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}

