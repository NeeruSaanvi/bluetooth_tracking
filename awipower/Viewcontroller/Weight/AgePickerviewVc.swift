//
//  AgePickerviewVc.swift
//  awipower
//
//  Created by Srajan on 27/10/20.
//

import UIKit
protocol convert_heightdatatoinches {
    func heighconvert_incm(cmdata:String,height_unit:String,inchdata:String,ftdata:String)
}

class AgePickerviewVc: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
   
    
    
    
    @IBOutlet weak var meterinc: UILabel!
    @IBOutlet weak var meterelbl: UILabel!
    var nutritionPickerData = ["1","2","3","4","5","6","7","8"]
    var nutritionPickerData1 = ["0","1","2","3","4","5","6","7","8","9","10","11","12"]
    var arrayHeight = NSMutableArray()
    var incarry = NSMutableArray()
    var customWidth:CGFloat = 55
    var rotationAngle:CGFloat!
    var customHeight:CGFloat = 200
    @IBOutlet weak var tippercentagePicker: UIPickerView!
    @IBOutlet weak var incpikerview: UIPickerView!
    var complete_datainc = ""
    var complete_dataft = ""
    var incdata:Int = 0
    var ftdata:Int = 0
    var inch = 0
    var height_unit = "1"
    @IBOutlet weak var pickerviewwidthconstant: NSLayoutConstraint!
    var delegate:convert_heightdatatoinches? = nil
    var isselected = false
    var dataconvert = 0
    var variablemetereft = ""
    var variablemeterein = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        for index in 50...250
//        {
//            arrayHeight.add(index)
//        }
//        rotationAngle = 360 * (.pi/180)
//        tippercentagePicker.transform = CGAffineTransform(rotationAngle: ((.pi/180)))
//        tippercentagePicker.selectRow(10, inComponent: 0, animated: true)
        pickerviewwidthconstant.constant = 0
        cm_in_add()
        
    }

    
    
    func fit_and_in(){
        arrayHeight = []
        for index in 1...8{
            arrayHeight.add(index)
        }
    }
    
    func cm_in_add(){
        arrayHeight = []
        for index in 150...250{
            arrayHeight.add(index)
        }
    }
    
    func cm_in_in(){
        for index in 0...12{
            incarry.add(index)
        }
    }
    
    // MARK:- Picker DataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == tippercentagePicker{
        return 1
        }else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == tippercentagePicker{
            return arrayHeight.count
        }else{
            return incarry.count
        }
        
    }
    
    
    // MARK:- Picker DataSource
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == tippercentagePicker {
            return arrayHeight[row] as! String
            
        } else {
            return incarry[row] as! String
            
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if pickerView == tippercentagePicker {
        return customWidth
        }else {
            return customWidth
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView == tippercentagePicker {
            let viewPick = UIView(frame: CGRect(x: 0, y: customHeight, width:customHeight, height: customHeight))
            let topLabel = UILabel(frame: CGRect(x: 0, y: customHeight/2 - 20, width:customHeight/2 - 20, height: 40))
            topLabel.textAlignment = .center
            topLabel.textColor = .black
            let dict = arrayHeight[row]
            if isselected == true {
                topLabel.text = "\(dict)"
                meterelbl.text = "ft"
                meterinc.text = "in"
                
            
                
                
            }else{
                topLabel.text = "\(dict)"
                meterelbl.text = "Cm"
                meterinc.text = ""
                
            }
            topLabel.font = UIFont.systemFont(ofSize: 40)
            viewPick.addSubview(topLabel)
            return viewPick
        }else {
            let viewPick1 = UIView(frame: CGRect(x: 0, y: customHeight, width:customHeight, height: customHeight))
            let topLabel1 = UILabel(frame: CGRect(x: 0, y: customHeight/2 - 20, width:customHeight/2 - 20, height: 40))
            topLabel1.textAlignment = .center
            topLabel1.textColor = .black
            let dict = incarry[row]
            topLabel1.text = "\(dict)"
            topLabel1.font = UIFont.systemFont(ofSize: 30)
            viewPick1.addSubview(topLabel1)
            return viewPick1
        }
       // let percntValue = "\(row + 5)"
     
        
        
        
        
        //        let bottomLabel = UILabel(frame: CGRect(x: 0, y: 80, width: customWidth, height: 20))
        //
        //        self.gratuity =  (round(100*((Double(percntValue) * amount)/100))/100)
        //        bottomLabel.text = "$"+String(format: "%.2f", self.gratuity)
        //
        //        bottomLabel.textAlignment = .center
        //        bottomLabel.textColor = .black
        //        viewPick.addSubview(bottomLabel)
        
//        viewPick.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
       
      
        if pickerView == tippercentagePicker {
        let dict = arrayHeight[row]
            if isselected == true {
                let ftstring = dict
                ftdata = ftstring as! Int
                height_unit = "2"
            }else {
                ftdata =  dict as! Int
                height_unit = "1"
            }
        }else{
                let dict = incarry[row]
                  let incstring = dict
            inch =  Int((incstring as! Double * 2.54))
        }
       
       
 
        
    }
    
    
    
    @IBAction func updatebtn(sender:UIButton){
        let dataconverttocm =  "\(ftdata)" + "." + "\(inch)"
        var convertcm = 0.0
        if height_unit == "1"{
            convertcm = Double(dataconverttocm)!
            convercmtometer(cm: Double(convertcm))
        }else {
            let feettoinch = ftdata * 12
            convertcm = Double( feettoinch + inch * Int(30.48))
            convercmtometer(cm: Double(convertcm))
        }
        
        delegate?.heighconvert_incm(cmdata: String(dataconverttocm), height_unit: height_unit,inchdata:"\(inch)",ftdata:"\(ftdata)")
      
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func convercmtometer(cm:Double){
        let completedata = cm / 100
//        ModelProfile.shared.height = "\(completedata)"
        UserDefaults.standard.setValue("\(completedata)", forKey: "heightcm")
    }
    
    
    @IBAction func cancel(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func showFootAndInchesFromCm(_ cms: Double) -> String {

          let feet = cms * 0.0328084
          let feetShow = Int(floor(feet))
          let feetRest: Double = ((feet * 100).truncatingRemainder(dividingBy: 100) / 100)
          let inches = Int(floor(feetRest * 12))

          return "\(feetShow)' \(inches)\""
    }
    
    @IBAction func Segment_clickedbtm(_ sender: Any) {
    
        let seg:Int! = (sender as AnyObject).selectedSegmentIndex
        if seg == 0 {
            
            isselected = false
            pickerviewwidthconstant.constant = 0
            
            
        }else {
            isselected = true
            fit_and_in()
            cm_in_in()
            pickerviewwidthconstant.constant = 180
        }
        
        
        
        
    }
    
}
