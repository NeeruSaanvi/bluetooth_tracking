//
//  CompleteBodypartVC.swift
//  awipower
//
//  Created by Srajan on 06/11/20.
//

import UIKit
enum TimerSteps : Int
{
    case RampUp = 1
    case RampDown = 3
    case PluseTime = 2
    case PauseTime = 4
}

class CompleteBodypartVC: BaseClassController  {
    
    @IBOutlet weak var lblWorkingTimeTotal: UILabel!
    @IBOutlet weak var lblWorkoutTimerRunning: UILabel!
    @IBOutlet weak var lblTimerDisplay: UILabel!
    
    @IBOutlet weak var calorieslbl: UILabel!
    @IBOutlet weak var startbtn: UIButton!
    @IBOutlet weak var stopbtn: UIButton!
    @IBOutlet weak var resetbtn: UIButton!
    
    @IBOutlet weak var allactive_plusbtn: UIButton!
    @IBOutlet weak var allactive_minusbtn: UIButton!
    
    @IBOutlet weak var active_view: UIView!
    
    
    var timerObj: Timer!
    // workout timer object
    var workoutTimer: Timer!
    var timer: Timer!
    
    //current workout time value
    var currentWorkOutTime = 0
    var stepSequence = 0
    
    var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
    
    // ready timer
    var secondstime = 3
    
    
   //MARK: ALL Body UperPart:
    @IBOutlet weak var chestimag: UIImageView!
    @IBOutlet weak var armimag: UIImageView!
    @IBOutlet weak var legimag: UIImageView!
    @IBOutlet weak var abdomenimag: UIImageView!

    @IBOutlet weak var armarrowview: UIView!
    @IBOutlet weak var chestrrowview: UIView!
    @IBOutlet weak var abdomenview: UIView!
    @IBOutlet weak var legview: UIView!
    

    //MARK: ALL Body downerPart:
    @IBOutlet weak var backsholderimage: UIImageView!
    @IBOutlet weak var shoulderimag: UIImageView!
     @IBOutlet weak var middileimag: UIImageView!
     @IBOutlet weak var Glutesimag: UIImageView!
     @IBOutlet weak var waistnimag: UIImageView!
     @IBOutlet weak var backleg: UIImageView!
    @IBOutlet weak var shoulderview: UIView!
    @IBOutlet weak var Glutesview: UIView!
    @IBOutlet weak var middileview: UIView!
    @IBOutlet weak var waistview: UIView!
    
    //MARK: ALL Body UperPartlbl:
    @IBOutlet weak var armlbl: UILabel!
    @IBOutlet weak var armlblname: UILabel!
    @IBOutlet weak var chetlbl: UILabel!
    @IBOutlet weak var chetnamelbl: UILabel!
    
    @IBOutlet weak var abdomenlbl: UILabel!
    @IBOutlet weak var abdomennamelbl: UILabel!
    @IBOutlet weak var leglbl: UILabel!
    @IBOutlet weak var legnamelbl: UILabel!
    
    
    //MARK: ALL Body downPartlbl:
    
    @IBOutlet weak var shuolderlbl: UILabel!
    @IBOutlet weak var shuoldernamelbl: UILabel!
    @IBOutlet weak var Gluteslbl: UILabel!
    @IBOutlet weak var Glutesnamelbl: UILabel!
    @IBOutlet weak var middlebacklbl: UILabel!
    @IBOutlet weak var middlebacknamelbl: UILabel!
    @IBOutlet weak var middlebacknamelbl1: UILabel!
    @IBOutlet weak var waistlbl: UILabel!
    @IBOutlet weak var waistnamelbl: UILabel!
    
    @IBOutlet weak var arm_increasebtn:UIButton!
    @IBOutlet weak var arm_decresbtn:UIButton!
    @IBOutlet weak var chest_increasebt:UIButton!
    @IBOutlet weak var chest_decresbtn:UIButton!
    @IBOutlet weak var shoulder_increasebtn:UIButton!
    @IBOutlet weak var shoulder_decresbtn:UIButton!
    @IBOutlet weak var glutes_increasebtn:UIButton!
    @IBOutlet weak var glutes_decresbtn:UIButton!
    @IBOutlet weak var abdomen_increasebtn:UIButton!
    @IBOutlet weak var abdomen_decresbtn:UIButton!
    @IBOutlet weak var leg_increasebtn:UIButton!
    @IBOutlet weak var leg_decresbtn:UIButton!
    @IBOutlet weak var middleback_increasebtn:UIButton!
    @IBOutlet weak var middleback_decresbtn:UIButton!
    @IBOutlet weak var waist_increasebtn:UIButton!
    @IBOutlet weak var waist_decresbtn:UIButton!

    // values from previous controller
    var workingtimeshow = Int()
    var pulse_data = Int()
    var pause_data = Int()
    var rampupdata = Int()
    var rampdowndata = Int()
    var frequency = Int()
    var pulse_width = Int()
    var mode = ""
    

    var isselectedpart = false
    var toggle = UISwitch()
    
    // Parts values
    var armValue = 0
    var chestValue = 0
    var abdomenValue = 0
    var shoulderValue = 0
    var middleBackValue = 0
    var waistValue = 0
    var glutesValue = 0
    var legValue = 0
    var enableArray = NSMutableArray()
    var tagvalue = 0
    var caloriesburnvalue = "0"
    var workout_totalminutes = 0
    
    // Command Tool Object
    
    var model = TrainModel()
    var commTool = BlueToothCommTool()
    var active_btn = true
    var calPerSec = 0.0
    var profilemodel = ModelProfile()
    var total = 0
    var timeDisplayCount = 0
    var calories = 0.0
    
    
    let caloriesmodel = Caloriesmodel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton()
        
        
        rampdowndata =  Int(model.mode_value_dowm)
        pause_data = Int(model.mode_value_off)
        pulse_data = Int(model.mode_value_on)
        workingtimeshow = Int(model.periodTotal)
        rampupdata = Int(model.mode_value_climb)
        frequency = Int(model.mode_value_frequency)
        pulse_width = Int(model.mode_value_wide)
       
        
        
        //stopbtn.isEnabled = false
        self.setupBarButtonItem()
        self.tabBarController?.tabBar.isHidden = true
        
        allboadyparthide_image()
        
        self.lblTimerDisplay.text = "READY"
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            if self.secondstime == 0 {
                print("Go!")
                self.lblTimerDisplay.isHidden = true
                timer.invalidate()
            } else {
                self.lblTimerDisplay.text = "\(self.secondstime)"
                self.secondstime -= 1
            }
            
        }
        
        self.setDefaultValues()
        //MARK: comment by me
        let arrTemp = commTool.initialInstructs
        for case let comm as CommandModel in arrTemp
        {
            ConnectWithDeviceViewController.shared.sendData(data: comm.instruct)
        }
        self.model.resetModel()
        calorieslbl.text = "0.0/cal"
        
        self.calorieslbl.text = String(format: "%.1f/cal", self.model.calories)
        
        self.add_calories()
    }
    
    func setDefaultValues()
    {
        
        self.lblWorkoutTimerRunning.text = " /00:00"
        var seconds = 0
        var minutes = 0
        if(workingtimeshow > 59)
        {
            seconds = workingtimeshow % 60
            minutes = workingtimeshow / 60
        }
        else{
            minutes = workingtimeshow
        }
        
        lblWorkingTimeTotal.text = "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        UIApplication.shared.isStatusBarHidden = true
        calorieslbl.text = "0.0/cal"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    private func setupBarButtonItem() {
//        let offLabel = UILabel()
//        offLabel.font = UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize)
//        offLabel.text = "All"
//        offLabel.textColor = UIColor.white
//        offLabel.font = UIFont(name:"Poppins", size: 20.0)
//
//        toggle.addTarget(self, action: #selector(toggleValueChanged(_:)), for: .valueChanged)
//        let stackView = UIStackView(arrangedSubviews: [offLabel,toggle])
//        toggle.tintColor = UIColor.white
//        toggle.backgroundColor = UIColor.white
//        toggle.layer.cornerRadius = 16
//        stackView.spacing = 8
//        toggle.tintColor = UIColor.white
//        toggle.onTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
//        toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stackView)
    }
    
    //MARK: all hide imagebodypart:
    func allboadyparthide_image(){
        chestimag.isHidden = true
        backsholderimage.isHidden = true
        armimag.isHidden = true
        legimag.isHidden = true
        abdomenimag.isHidden = true
        shoulderimag.isHidden = true
        middileimag.isHidden = true
        Glutesimag.isHidden = true
        waistnimag.isHidden = true
        backleg.isHidden = true
        armarrowview.isHidden = true
        chestrrowview.isHidden = true
        abdomenview.isHidden = true
        legview.isHidden = true
        shoulderview.isHidden = true
         Glutesview.isHidden = true
         middileview.isHidden = true
         waistview.isHidden = true
        armlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        armlblname.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        chetlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        chetnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        abdomenlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        abdomennamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        leglbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        legnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        shuolderlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        shuoldernamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        Gluteslbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        Glutesnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        middlebacklbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        middlebacknamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        middlebacknamelbl1.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        waistlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        waistnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
        disabel_button()
    }
    
    
    
    //MARK: disabele_button:
    func disabel_button(){
        arm_increasebtn.isEnabled = false
        arm_decresbtn.isEnabled = false
        leg_increasebtn.isEnabled = false
        leg_decresbtn.isEnabled = false
        shoulder_increasebtn.isEnabled = false
        shoulder_decresbtn.isEnabled = false
        glutes_increasebtn.isEnabled = false
        glutes_decresbtn.isEnabled = false
        waist_increasebtn.isEnabled = false
        waist_decresbtn.isEnabled = false
        abdomen_increasebtn.isEnabled = false
        abdomen_decresbtn.isEnabled = false
        middleback_increasebtn.isEnabled = false
        middleback_decresbtn.isEnabled = false
        chest_increasebt.isEnabled = false
        chest_decresbtn.isEnabled = false
    }
   
    
    
    
    
    @objc func toggleValueChanged(_ toggle: UISwitch) {
        print("new value: \(toggle.isOn)")
        
        if isselectedpart == true {
            if toggle.isOn == true {
                
                allboadypartshow_image()
                toggle.thumbTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                allboadyparthide_image()
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
            }
        }else {
            if toggle.isOn == true {
                allboadypartshow_image()
                toggle.thumbTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                allboadyparthide_image()
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
            }
        }
        
        
    }
    
    //MARK: all show imagebodypart:
    func allboadypartshow_image(){
        chestimag.isHidden = false
        backsholderimage.isHidden = false
        armimag.isHidden = false
        legimag.isHidden = false
        abdomenimag.isHidden = false
        shoulderimag.isHidden = false
        middileimag.isHidden = false
        Glutesimag.isHidden = false
        waistnimag.isHidden = false
        backleg.isHidden = false
        armarrowview.isHidden = false
        chestrrowview.isHidden = false
        abdomenview.isHidden = false
         legview.isHidden = false
         shoulderview.isHidden = false
         Glutesview.isHidden = false
         middileview.isHidden = false
         waistview.isHidden = false
        armlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        armlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        armlblname.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        chetlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        chetnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        abdomenlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        abdomennamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        leglbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        legnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        shuolderlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        shuoldernamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        Gluteslbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        Glutesnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        middlebacklbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        middlebacknamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        middlebacknamelbl1.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        waistlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        waistnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        enabeld_button()
    }
    
    //MARK:enabeld_button_
    func enabeld_button() {
        arm_increasebtn.isEnabled = true
        arm_decresbtn.isEnabled = true
        leg_increasebtn.isEnabled = true
        leg_decresbtn.isEnabled = true
        shoulder_increasebtn.isEnabled = true
        shoulder_decresbtn.isEnabled = true
        glutes_increasebtn.isEnabled = true
        glutes_decresbtn.isEnabled = true
        waist_increasebtn.isEnabled = true
        waist_decresbtn.isEnabled = true
        abdomen_increasebtn.isEnabled = true
        abdomen_decresbtn.isEnabled = true
        middleback_increasebtn.isEnabled = true
        middleback_decresbtn.isEnabled = true
        chest_increasebt.isEnabled = true
        chest_decresbtn.isEnabled = true
        
        
    }
    
    
    
    //MARK:- Start button action
    @IBAction func startTimer(_ sender: UIButton) {
       
        if(sender.isSelected)
        {
            if(self.timerObj != nil)
            {
                self.timerObj.invalidate()
                timerObj = nil
              
            }
            if (self.timer != nil) {
                self.timer.invalidate()
            }
         
           
        }
        else{
            startTimer(index: TimerSteps.RampUp.rawValue)
            
        }
        sender.isSelected = !sender.isSelected
        
        startStopworkoutTime()
       
       
    }
    
    
    
    
    
    func getcaolories() -> Double{
        var calTotal = Double()
        switch model.trainType {
            case .diet:
                calTotal = 495
            case .mucle:
                calTotal = 520
            case .aerobic:
                calTotal = 275
            case .perfesion:
                calTotal = 550
            case .relax:
                calTotal = 220
            default:
                calTotal = 500
                break
        }
       
        var partValue = model.averageValue / 10 * 10 - 10
        partValue = partValue > 0 ? partValue : 0
//        var weight = UtilityClass.getUserDefault(key:"weight") ?? "0.0"
//        var height = UtilityClass.getUserDefault(key:"height") ?? "0.0"
//        height  = ModelProfile.shared.height!
//        weight  =  ModelProfile.shared.height!
        if ModelProfile.shared.height == "" ||   ModelProfile.shared.weight == "" {
          
        }else {
            self.calPerSec = (calTotal + (Double(ModelProfile.shared.height)! - 170) / 10 * 3 + Double(ModelProfile.shared.weight)! - 140 / 10 * 4 + Double(partValue)) / 20 / 60
        }
        
    //   calPerSec = (calTotal + (Double(height) - 170) / 10 * 3 + (Double(weight) - 140) / 10 * 4 + partValue) / 20 / 60
        return calPerSec
    }
    
    // set workout timer method
    func startStopworkoutTime()
    {
        if(workoutTimer != nil)
        {
            workoutTimer.invalidate()
            workoutTimer = nil
            self.lblTimerDisplay.isHidden = true
            //send stop command to suite
            let pause = commTool.getPauseComm()
            ConnectWithDeviceViewController.shared.sendData(data: pause.instruct)
        }
        else{
            workoutTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                self.currentWorkOutTime += 1
                
                var hours = 0
                var minutes = 0
              
                if(self.currentWorkOutTime > 59)
                {
                    hours = self.currentWorkOutTime / 60
                    minutes = self.currentWorkOutTime % 60
                }
                else{
                    minutes = self.currentWorkOutTime
                  
                    
                }
                
                self.lblWorkoutTimerRunning.text = " /\(String(format: "%02d", hours)):\(String(format: "%02d", minutes))"
                let value_timer = "\(String(format: "%02d", hours)):\(String(format: "%02d", minutes))"
                
                //calulateseconds = (self.total / 10) % 60
                if self.currentWorkOutTime % 6 ==  0  {
                        self.timerFunc()
                }
                if self.currentWorkOutTime % 60 == 0 {
                    self.updatedate_calories(minutes: minutes * 60)
                       
                }
                
            })
            
            //send start command to suite
            let start = commTool.getStartComm()
            ConnectWithDeviceViewController.shared.sendData(data: start.instruct)
        }
    }
    
    func setTotal(_ total: Int) {
        if total < 0 {
            self.total = total
            //timeLabel.text = "\(model.periodTotal):00/00:00"
            return
        }
        let min = total / 600
        let sec = (total / 10) % 60
        self.total = total
        if total == 0 {
            return
        }
       //timeLabel.text = String(format: "%d:00/%02d:%02d", model.periodTotal, min, sec)
        self.total = total
    }
    
    func startTimer(index: Int)
    {
        
        self.lblTimerDisplay.isHidden = false
        var intervel = 0.0
        var color = UIColor.black
        if(index == TimerSteps.RampUp.rawValue)
        {
            self.lblTimerDisplay.text! = "1"
            intervel = 0.1
            color = UIColor.gray
        }
        else
        if(index == TimerSteps.PluseTime.rawValue)
        {
            self.lblTimerDisplay.text! = "1"
            intervel = 1.0
            color = UIColor.red
        }
        else
        if(index == TimerSteps.RampDown.rawValue)
        {
            self.lblTimerDisplay.text! = "\(self.rampdowndata)"
            intervel = 0.1
            color = UIColor.lightGray
        }
        else
        if(index == TimerSteps.PauseTime.rawValue)
        {
            self.lblTimerDisplay.text! = "1"
            intervel = 1
            color = UIColor.black
        }
        self.lblTimerDisplay.textColor = color
        
        if(timerObj != nil)
        {
            timerObj.invalidate()
            timerObj = nil
        }
        
        timerObj = Timer.scheduledTimer(withTimeInterval: intervel, repeats: true, block: { (timer) in
            
            var value = Int(self.lblTimerDisplay.text!) ?? 0
            if(index == TimerSteps.RampDown.rawValue)
            {
                if(value > 0)
                {
                    value -= 1
                }
            }
            else{
                value += 1
            }
            
            self.lblTimerDisplay.text = "\(value)"
           
//            controRegReset.regDesLow = 0x00
//            controRegReset.regControlData = 0x01
            if(index == TimerSteps.RampUp.rawValue && self.rampupdata == value)
            {
                self.startTimer(index : TimerSteps.PluseTime.rawValue)
                if(self.enableArray.count > 0){
                    let commands = NSMutableArray()
                    
                    
                    for value in self.enableArray {
                        commands.add(self.commTool.unablePosition(value as! Int32))
                    }
//
                    for case let comm as CommandModel in commands {
                        ConnectWithDeviceViewController.shared.sendData(data: comm.instruct)
                    }
                
                }
            }
            else
            if(index == TimerSteps.PluseTime.rawValue && self.pulse_data == value)
            {
                self.startTimer(index : TimerSteps.RampDown.rawValue)
                
                if(self.enableArray.count > 0){
                    let commands = NSMutableArray()
                    
                    let arr = self.commTool.getCommandsWithPosition(Int32(self.tagvalue), value: Int32(value))
                    commands.addObjects(from: arr)
                    
                    for value in self.enableArray {
                        commands.add(self.commTool.enablePosition(value as! Int32))
                    }
                    for case let comm as CommandModel in commands {
                        ConnectWithDeviceViewController.shared.sendData(data: comm.instruct)
                    }
                }
            }
            else
            if(index == TimerSteps.RampDown.rawValue && 1 == value)
            {
                self.startTimer(index : TimerSteps.PauseTime.rawValue)
            }
            else
            if(index == TimerSteps.PauseTime.rawValue && self.pause_data == value)
            {
                self.startTimer(index : TimerSteps.RampUp.rawValue)
            }
            
        })
    }
    
    
    @IBAction func resetTimer(_ sender: Any) {
    
        self.setDefaultValues()
        updatedate_calories(minutes: self.currentWorkOutTime % 60)
     
    }
    
    
    
    @objc func timerFunc() {
    calorieslbl.text = ""
    calories += getcaolories() * 6
    calorieslbl.text = String(format: "%.1f/cal", calories)
    self.caloriesburnvalue =  String(format: "%.1f", calories)
   
//    timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { (timer) in
//
//
//
//        })
//

    }
    
    
    
    
    
    
    
    
    //MARK: Addd calories in api
    func add_calories(){
        caloriesmodel.mode = mode
        if  self.currentWorkOutTime != nil {
            let convertminute =  self.currentWorkOutTime % 60
            let seocnds = convertminute * 60
            
            caloriesmodel.exercise_time = String(seocnds)
        }
       
        caloriesmodel.calorie_value = caloriesburnvalue
        caloriesmodel.pulse_time = String(pulse_data)
        caloriesmodel.pause_time = String(pause_data)
        caloriesmodel.working_time = String(workingtimeshow)
        caloriesmodel.frequency = String(frequency)
        caloriesmodel.pulse_width = String(pulse_width)
        caloriesmodel.ramp_down = String(rampdowndata)
        caloriesmodel.ramp_up = String(rampupdata)
        caloriesmodel.arm_value = String(self.armlbl.text!)
        caloriesmodel.chest_value = String(self.chetlbl.text!)
        caloriesmodel.shoulder_value = String(self.shuolderlbl.text!)
        caloriesmodel.gluts_value = String(self.Gluteslbl.text!)
        caloriesmodel.abdomen_value = String(self.abdomenlbl.text!)
        caloriesmodel.leg_value = String(self.leglbl.text!)
        caloriesmodel.middle_back_value = String(self.middlebacklbl.text!)
        caloriesmodel.waist_value = String(self.waistlbl.text!)

        caloriesmodel.Caloriesadd { (suceess, message) in
            if suceess {

            }else {
                
            }
        }
    }
    
    
    
    //MARK: update_api_calories)_

    func updatedate_calories(minutes:Int){
        caloriesmodel.mode = mode
        caloriesmodel.exercise_time = String(minutes)
        caloriesmodel.calorie_value = caloriesburnvalue
        caloriesmodel.pulse_time = String(pulse_data)
        caloriesmodel.pause_time = String(pause_data)
        caloriesmodel.working_time = String(workingtimeshow)
        caloriesmodel.frequency = String(frequency)
        caloriesmodel.pulse_width = String(pulse_width)
        caloriesmodel.ramp_down = String(rampdowndata)
        caloriesmodel.ramp_up = String(rampupdata)
        caloriesmodel.arm_value = String(self.armlbl.text!)
        caloriesmodel.chest_value = String(self.chetlbl.text!)
        caloriesmodel.shoulder_value = String(self.shuolderlbl.text!)
        caloriesmodel.gluts_value = String(self.Gluteslbl.text!)
        caloriesmodel.abdomen_value = String(self.abdomenlbl.text!)
        caloriesmodel.leg_value = String(self.leglbl.text!)
        caloriesmodel.middle_back_value = String(self.middlebacklbl.text!)
        caloriesmodel.waist_value = String(self.waistlbl.text!)
        self.caloriesmodel.Caloriesupdate { (sucess,message) in
            
        }
        
        
        
    }

    
    
    
    
    //MARK: body_part_active_deactive
    @IBAction func armactivebtn(sender:UIButton){
        
        var value = 100
        if sender.tag == 0{
            value = armValue
             tagvalue = 5
            if sender.isSelected == true {
                armlblname.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                armlbl.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
                armarrowview.isHidden = true
                isselectedpart = true
                armimag.isHidden = true
                
                backsholderimage.isHidden = true
                arm_increasebtn.isEnabled = true
                arm_decresbtn.isEnabled = true
                enableArray.add(sender.tag)
                
            }else {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                armlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                armlblname.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                armimag.isHidden = false
                backsholderimage.isHidden = false
                armarrowview.isHidden = false
                isselectedpart = false
                sender.isSelected = false
                arm_increasebtn.isEnabled = false
                arm_decresbtn.isEnabled = false
               
                
            }
           
        }else if sender.tag == 1{
            
            value = chestValue
            tagvalue = 4
            if sender.isSelected == true  {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                abdomenlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                abdomennamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                abdomenview.isHidden = true
                isselectedpart = true
                chestimag.isHidden = true
                enableArray.add(sender.tag)
                chest_increasebt.isEnabled = true
                chest_decresbtn.isEnabled = true
            }else{
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                abdomenlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                abdomennamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                abdomenview.isHidden = false
                isselectedpart = false
                chestimag.isHidden = false
                chest_increasebt.isEnabled = false
                chest_decresbtn.isEnabled = false
                
                enableArray.remove(sender.tag)
          
              
            }
         
        }else if sender.tag == 2{
            value = shoulderValue
            tagvalue = 2
            if sender.isSelected == true  {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                shuolderlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                shuoldernamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                shoulderview.isHidden = false
                isselectedpart = false
                shoulderimag.isHidden = false
                shoulder_increasebtn.isEnabled = true
                shoulder_decresbtn.isEnabled = true
                enableArray.remove(sender.tag)
               
            }else {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                shuolderlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                shuoldernamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                shoulderview.isHidden = true
                isselectedpart = true
                shoulderimag.isHidden = true
                enableArray.add(sender.tag)
                shoulder_increasebtn.isEnabled = false
                shoulder_decresbtn.isEnabled = false
               
            }
        }else if sender.tag == 3{
            value = glutesValue
            tagvalue = 1
            if isselectedpart == true {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                Gluteslbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                Glutesnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                Glutesview.isHidden = false
                isselectedpart = false
                Glutesimag.isHidden = false
                enableArray.remove(sender.tag)
                glutes_increasebtn.isEnabled = true
                glutes_decresbtn.isEnabled = true
              
            }else {
                
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                Gluteslbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                Glutesnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                Glutesview.isHidden = true
                Glutesimag.isHidden = true
                isselectedpart = true
                enableArray.add(sender.tag)
                glutes_increasebtn.isEnabled = false
                glutes_decresbtn.isEnabled = false
               
               
            }
        }else if sender.tag == 4{
            
            value = abdomenValue
            tagvalue = 7
            if sender.isSelected == true  {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                chetlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                chestrrowview.isHidden = false
                chetnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                isselectedpart = false
                abdomenimag.isHidden = false
                enableArray.remove(sender.tag)
                abdomen_increasebtn.isEnabled = true
                abdomen_decresbtn.isEnabled = true
                
            } else {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                chetlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                chestrrowview.isHidden = true
                chetnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                isselectedpart = true
                abdomenimag.isHidden = true
                enableArray.add(sender.tag)
                abdomen_increasebtn.isEnabled = false
                abdomen_decresbtn.isEnabled = false
      
                }
            
        }else if sender.tag == 5 {
            
            value = legValue
            tagvalue = 6
            
            if sender.isSelected == true {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                legnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                legview.isHidden = false
                leglbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                isselectedpart = false
                legimag.isHidden = false
                backleg.isHidden = false
                leg_increasebtn.isEnabled = true
                leg_decresbtn.isEnabled = true
                enableArray.remove(sender.tag)
            }else {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                legnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                legview.isHidden = true
                leglbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                legimag.isHidden = true
                backleg.isHidden = true
                isselectedpart = true
                leg_increasebtn.isEnabled = false
                leg_decresbtn.isEnabled = false
               
                
            }
            
        }else if sender.tag == 6{
            
            value = middleBackValue
            tagvalue = 3
            if sender.isSelected == true  {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                middlebacklbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                middlebacknamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                middlebacknamelbl1.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                middileview.isHidden = false
                middileimag.isHidden = false
                isselectedpart = false
                middleback_increasebtn.isEnabled = true
                middleback_decresbtn.isEnabled = true
            }else {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                middlebacklbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                middlebacknamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                middlebacknamelbl1.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                middileview.isHidden = true
                middileimag.isHidden = true
                isselectedpart = true
                middleback_increasebtn.isEnabled = false
                middleback_decresbtn.isEnabled = false
                
                
            }
            
        }else {
            
            value = waistValue
            tagvalue = 0
            
            if sender.isSelected == true  {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                waistlbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                waistview.isHidden = false
                waistnamelbl.textColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                isselectedpart = false
                waistnimag.isHidden = false
                waist_increasebtn.isEnabled = true
                waist_decresbtn.isEnabled = true
              
                
            }else {
                toggle.isOn = false
                toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
                waistlbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                waistview.isHidden = true
                waistnamelbl.textColor = #colorLiteral(red: 0.6549019608, green: 0.6549019608, blue: 0.662745098, alpha: 1)
                isselectedpart = true
                waistnimag.isHidden = true
                waist_increasebtn.isEnabled = false
                waist_decresbtn.isEnabled = false
               
            }
        }
        
        
        sender.isSelected = !sender.isSelected
        if(sender.isSelected)
        {
            enableArray.add(tagvalue)
            //let tag = sender.tag
            let arr = self.commTool.getCommandsWithPosition(Int32(tagvalue), value: Int32(value))
            for case let command as CommandModel in arr{
                ConnectWithDeviceViewController.shared.sendData(data: command.instruct)
            }
        }
        else{
            enableArray.remove(tagvalue)
            let command = self.commTool.unablePosition(Int32(tagvalue))
            ConnectWithDeviceViewController.shared.sendData(data: command.instruct)
        }
    }
    
    
    
//MARK: Count Body Countarma
    @IBAction func countarmactive(sender: UIButton){
        armValue = Int(self.armlbl.text!)!
        if sender.tag == 0 {
            armValue += 1
        }else {
            if(armValue > 0)
            {
                armValue -= 1
            }
            
        }
       
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(armValue))
        self.armlbl.text = String(format: "%02d", armValue)
    }
        
    //MARK: Count Body Countabdomen
    @IBAction func countabdomenctive(sender: UIButton){
//        let value =  Int(self.abdomenlbl.text!)
        abdomenValue = Int(self.abdomenlbl.text!)!
        if sender.tag == 0 {
            abdomenValue += 1
        }else {
            if(abdomenValue > 0)
            {
                abdomenValue -= 1
            }
        }
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(abdomenValue))
        self.abdomenlbl.text = String(format: "%02d", abdomenValue)
    }
    
    //MARK: Count Body Countabdomen
    @IBAction func countshoulderctive(sender: UIButton){
//        let value =  Int(self.shuolderlbl.text!)
        shoulderValue = Int(self.shuolderlbl.text!)!
        if sender.tag == 0 {
            shoulderValue += 1
        }else {
            if (shoulderValue > 0) {
                shoulderValue -= 1
            }
        }
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(shoulderValue))
        self.shuolderlbl.text = String(format: "%02d", shoulderValue)
    }
    
    //MARK: Count Body Countglutes
    @IBAction func countglutesctive(sender: UIButton){
        glutesValue = Int(self.Gluteslbl.text!)!
        if sender.tag == 0 {
            glutesValue += 1
        }else {
            if (glutesValue > 0) {
                glutesValue -= 1
            }
        }
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(glutesValue))
        self.Gluteslbl.text = String(format: "%02d", glutesValue)
    }
    
    //MARK: Count Body Countchest
    @IBAction func countchestctive(sender: UIButton){
        chestValue = Int(self.chetlbl.text!)!
        if sender.tag == 0 {
            chestValue += 1
        }else {
            if (chestValue > 0) {
                chestValue -= 1
            }
        }
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(chestValue))
        
        self.chetlbl.text = String(format: "%02d", chestValue)
    }
    
    //MARK: Count Body Countleg
    @IBAction func countlegactive(sender: UIButton){
        legValue = Int(self.leglbl.text!)!
        if sender.tag == 0 {
            legValue += 1
        }else {
            if (legValue > 0) {
                legValue -= 1
            }
        }
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(legValue))
        self.leglbl.text = String(format: "%02d", legValue)
    }
    
    //MARK: Count Body CountMidleback
    @IBAction func countmidlebackactive(sender: UIButton){
        middleBackValue = Int(self.middlebacklbl.text!)!
        if sender.tag == 0 {
            middleBackValue += 1
        }else {
            if (middleBackValue > 0) {
                middleBackValue -= 1
            }
        }
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(legValue))
        self.middlebacklbl.text = String(format: "%02d", middleBackValue)
    }
    
       //MARK: Count Body CountWest
    @IBAction func countwestactive(sender: UIButton){
        waistValue = Int(self.waistlbl.text!)!
        if sender.tag == 0 {
            waistValue += 1
        }else {
            if (waistValue > 0) {
                waistValue -= 1
            }
        }
        data_sendpostion_tag(posstion:Int32(tagvalue), value:Int32(waistValue))

        self.waistlbl.text = String(format: "%02d", waistValue)
    }
    
    
    
    func data_sendpostion_tag(posstion:Int32,value:Int32){
        var comms: [Any] = []
        let commArray = commTool.getCommandsWithPosition(Int32(posstion), value: Int32(value))
        comms.append(commArray)
    }
    
    
    //MARK:- Bluetooth command send function
    
//    func startBodyPart(sequence: Int, currentvalues: Int)
//    {
//        let data = self.commTool.getCommandsWithPosition(Int32(sequence), value: Int32(currentvalues))
//        for case let command as CommandModel in data {
//            ConnectWithDeviceViewController.shared.sendData(data: command.instruct)
//        }
//    }
//
//    func stopBodyPart(sequence: Int, currentvalues: Int)
//    {
//        let command = self.commTool.unablePosition(Int32(sequence))
//        ConnectWithDeviceViewController.shared.sendData(data: command.instruct)
//    }

    
    
    @IBAction func allactive_btnClicked(_ sender: UIButton) {
        var value = 0
        if sender.tag == 0{
          
            value = Int(armlbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            armlbl.text = "\(value)"
            
            
            value = Int(chetlbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            chetlbl.text = "\(value)"
            
            value = Int(abdomenlbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            abdomenlbl.text = "\(value)"
          
            
            value = Int(shuolderlbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            shuolderlbl.text = "\(value)"
            
            value = Int(Gluteslbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            Gluteslbl.text = "\(value)"
            
            value = Int(middlebacklbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            middlebacklbl.text = "\(value)"
            
            value = Int(waistlbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            waistlbl.text = "\(value)"
            
            value = Int(leglbl.text!)!
            if(value < 35)
            {
                value += 5
            }
            else{
                value += 1
            }
            leglbl.text = "\(value)"
            
            
        }else if sender.tag == 1 {
           value = Int(armlbl.text!)!
            if(value >= 5 && value <= 35)
            {
                value -= 5
            }
            else{
                if value == 0 {
                    
                }else {
                    value -= 1
                }
            }
            armlbl.text = "\(value)"
            
            
            value = Int(chetlbl.text!)!
            if(value >= 5 && value <= 35 )
            {
                value -= 5
            }
            else{
                if value == 0 {
                    
                }else {
                    value -= 1
                }
            }
            chetlbl.text = "\(value)"
            
            value = Int(abdomenlbl.text!)!
            if(value >= 5 && value <= 35 )
            {
                value -= 5
            }
            else{
                if value == 0 {
                    
                }else {
                    value -= 1
                }
            }
            abdomenlbl.text = "\(value)"
            
            
            value = Int(shuolderlbl.text!)!
            if(value >= 5 && value <= 35 )
            {
                value -= 5
            }
            else{
                if value == 0 {
                    
                }else {
                    value -= 1
                }
            }
            shuolderlbl.text = "\(value)"
            
            value = Int(Gluteslbl.text!)!
            if(value >= 5 && value <= 35 )
            {
                value -= 5
            }
            else{
                if value == 0 {
                    
                }else {
                    value -= 1
                }
            }
            Gluteslbl.text = "\(value)"
            
            value = Int(middlebacklbl.text!)!
            if(value >= 5 && value <= 35 )
            {
                value -= 5
            }
            else{
                if value == 0 {
                    
                }else {
                    value -= 1
                }
            }
            middlebacklbl.text = "\(value)"
            
            value = Int(waistlbl.text!)!
            if(value >= 5 && value <= 35 )
            {
                value -= 5
            }
            else{
                if value == 0 {
                    
                }else {
                    value -= 1
                }
            }
            waistlbl.text = "\(value)"
            
            value = Int(leglbl.text!)!
            if(value >= 5 && value <= 35 )
            {
                value -= 5
            }
            else {
               
                if value == 0 {
                    
                }else {
                    value -= 1
                }
                }
            leglbl.text = "\(value)"
    }
    
    }
    
    
    @IBAction func all_button_clicked(_ sender: UIButton) {
        
        if active_btn == true {
            allactive_plusbtn.isSelected = true
            allactive_minusbtn.isSelected = true
            active_btn = false
            active_view.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
            active_view.layer.borderWidth = 2
            allboadypartshow_image()
            active_view.layer.cornerRadius = 15
            active_view.clipsToBounds = true
            allactive_plusbtn.isEnabled = true
            allactive_minusbtn.isEnabled = true
            
        }else {
            
            allactive_plusbtn.isSelected = false
            allactive_minusbtn.isSelected = false
            allactive_plusbtn.isEnabled = false
            allactive_minusbtn.isEnabled = false
            
            active_btn = true
            allboadyparthide_image()
            active_view.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            active_view.layer.borderWidth = 2
            active_view.layer.cornerRadius = 15
            active_view.clipsToBounds = true
        }
        
        
    }
    
    
    
    
    
}
