//
//  WeightPickerViewViewController.swift
//  awipower
//
//  Created by Srajan on 02/02/21.
//

import UIKit
import KRProgressHUD
protocol weight_datasendregister{
    func data_show_weight(dataadd:String,weight_unit:String,Kg:String,gram:String)
}




class WeightPickerViewViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBOutlet weak var grampickerview: UIPickerView!
    var arrayHeight = NSMutableArray()
    @IBOutlet weak var segmentbtn: UISegmentedControl!
    var customWidth:CGFloat = 55
    var rotationAngle:CGFloat!
    var customHeight:CGFloat = 200
    var gram_data = ["0","500"]
    let add_datagetweight = WeightgetModel()
    @IBOutlet weak var gramlblconstant: NSLayoutConstraint!
    @IBOutlet weak var meterlbl: UILabel!
    @IBOutlet weak var gramlblcontantrallingconstant: NSLayoutConstraint!
    @IBOutlet weak var meterlblg: UILabel!
    @IBOutlet weak var secondpickerviewdata: NSLayoutConstraint!
    
    var deligate:weight_datasendregister? = nil
    var converdatakgtogram = 0
    var grmadata = 0
    var lbsdata = 0
    var convertkgtolbs = false
    var weight_unit = ""
    var kgdata = ""
    var gram = ""
    var isselectd = false
    @IBOutlet weak var weightpickerview: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentbtn.layer.borderColor = #colorLiteral(red: 0.9613141418, green: 0.4986458421, blue: 0.4898355603, alpha: 1)
        segmentbtn.layer.borderWidth = 1
        secondpickerviewdata.constant = 0
        convert_kg()
        gramlblconstant.constant = 30
        gramlblcontantrallingconstant.constant = 20
    }
    
    
    func converdata_kgandlbs(){
        arrayHeight = []
        for index in 30...250
        {
           arrayHeight.add(index)
        }
        
    }
    func convert_kg(){
        arrayHeight = []
        for index in 110...550
        {
           arrayHeight.add(index)
        }
        
    }
    
    
    
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == weightpickerview {
            return 1
        }
        else {
            return 1
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == weightpickerview {
            return arrayHeight.count
        }else {
            return gram_data.count
        }
     
        
    }
    
    
    // MARK:- Picker DataSource
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == weightpickerview {
            return arrayHeight[row] as? String
        }else {
            return gram_data[row] as? String
        }
            
       

    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if pickerView == weightpickerview {
        return customWidth
        }else{
        return customWidth
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView == weightpickerview {
            let viewPick = UIView(frame: CGRect(x: 0, y: customHeight, width:customHeight, height: customHeight))
            let topLabel = UILabel(frame: CGRect(x: 0, y: customHeight/2 - 20, width:customHeight + 20, height: 40))
            topLabel.textAlignment = .center
            topLabel.textColor = .black
            let dict = arrayHeight[row]
        if convertkgtolbs == true {
//            let convertrlb = Double((dict) as! Double * Double(2.205))
            topLabel.text = "\(dict)"
            meterlbl.text = "Kg"
            meterlblg.text = "Gm"
         //   topLabel.textAlignment = .right
            gramlblconstant.constant = 30
            gramlblcontantrallingconstant.constant = 20
            
        }else {
            topLabel.text = "\(dict)"
            meterlbl.text = ""
            meterlblg.text = "lbs"
            topLabel.textAlignment = .left
            gramlblconstant.constant = 180
            gramlblcontantrallingconstant.constant = 30
        }
            topLabel.font = UIFont.systemFont(ofSize: 40)
            viewPick.addSubview(topLabel)
            return viewPick
        }else {
            let viewPick1 = UIView(frame: CGRect(x: 0, y: customHeight, width:customHeight, height: customHeight))
            let topLabel1 = UILabel(frame: CGRect(x: 0, y: customHeight/2 - 20, width:customHeight + 20, height: 40))
            topLabel1.textAlignment = .center
            topLabel1.textColor = .black
            let dict = gram_data[row]
            topLabel1.text = "\(dict)"
            topLabel1.font = UIFont.systemFont(ofSize: 40)
            viewPick1.addSubview(topLabel1)
            return viewPick1
        }
           
          

    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == weightpickerview {
        let dict = arrayHeight[row]
            if convertkgtolbs == true {
                converdatakgtogram = (dict) as! Int
                
            }else {
                converdatakgtogram = (dict) as! Int
            }

        }else {
            let dict = gram_data[row]
            grmadata =  Int(dict) ?? 0
        }
        }
       
    
    
    
    @IBAction func segementbtn_click(_ sender: UISegmentedControl) {
        let seg:Int! = (sender as AnyObject).selectedSegmentIndex
        if seg == 0 {
            convert_kg()
            weightpickerview.reloadAllComponents()
            convertkgtolbs = false
            secondpickerviewdata.constant = 0
            
        }else {
            self.converdata_kgandlbs()
            convertkgtolbs = true
            weightpickerview.reloadAllComponents()
            secondpickerviewdata.constant = 200
        }
        
       
        
    }
    
    
    
    @IBAction func updatebtn(sender:UIButton){
        if isselectd == true {
       // deligate?.data_show_weight()
            var completedata = "0"
            if convertkgtolbs == true {
                
                let cdonvergram =   "\(converdatakgtogram)" + "." + "\(grmadata)"
                completedata = cdonvergram
                weight_unit = "2"
            }else {
                completedata = "\(converdatakgtogram)"
                weight_unit = "1"
            }
            add_datagetweight.value = completedata
            add_datagetweight.weight_unit = weight_unit
            deligate?.data_show_weight(dataadd:String(completedata), weight_unit:weight_unit,Kg:"\(converdatakgtogram)",gram: "\(grmadata)")
            add_datagetweight.Weightadd_api { (suceess,message) in
                if suceess {
                    KRProgressHUD.show()
                }else {
                    KRProgressHUD.showMessage(message)
                }
            }
        }else {
            var completedata = "0"
            if convertkgtolbs == true {
                let cdonvergram =   "\(converdatakgtogram)" + "." + "\(grmadata)"
                completedata = cdonvergram
                weight_unit = "2"
            }else {
                completedata = "\(converdatakgtogram)"
                weight_unit = "1"
            }
            deligate?.data_show_weight(dataadd:String(completedata), weight_unit:weight_unit,Kg:"\(converdatakgtogram)",gram: "\(grmadata)")
        }
        self.navigationController?.popViewController(animated: true)
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
    
    
    
    
    
    
    
    
    
    
    
   

}
