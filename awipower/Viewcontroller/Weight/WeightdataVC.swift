//
//  WeightdataVC.swift
//  awipower
//
//  Created by Srajan on 06/11/20.
//

import UIKit

class weightlistcell:UITableViewCell {
    @IBOutlet var weightdatalbl: UILabel!
    @IBOutlet var weightdatalbl1: UILabel!
    
    @IBOutlet weak var bmilabel: UILabel!
    @IBOutlet weak var underweightlbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet var datedatalbl: UILabel!
    
}
class WeightdataVC: BaseClassController{
    var modelget = WeightgetModel()
    @IBOutlet weak var heightshow:UILabel!
    @IBOutlet weak var tbt: UITableView!
    var date = ""
    var value = "0.0"
    var bmi = ""
    var lavel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        tbt.tableFooterView = UIView()
        self.navigationItem.title = "My Weight"
        
               let btn1 = UIButton(type: .custom)
               btn1.frame = CGRect(x: 0, y: 0, width: 32, height: 30)
            btn1.setImage(UIImage(named: "add_weight"), for: .normal)
            btn1.addTarget(self, action:#selector(add_weight), for: .touchUpInside)
            let addNew = UIBarButtonItem.init(customView: btn1)
        
        
//        let button1 = UIBarButtonItem(image: UIImage(named: "add_weight.png"), style: .plain, target: self, action:#selector(add_weight)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = addNew
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        modelget.Weightgetadd{(success,message)in
            if success{
                DispatchQueue.main.async {
                    var unitdata = 0.0
                    
                    if let dict = self.modelget.dataWeight[0] as? NSDictionary {
                        let date2 = dict["updated"] as! String
                        let dateFormatter1 = DateFormatter()
                        dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        let date3 = dateFormatter1.date (from: date2)
                        dateFormatter1.dateFormat = "dd-MM-yyyy HH:mm"
                        let result2 = dateFormatter1.string(from: date3!)
                        self.date  = "\(result2)"
                        self.value = dict["value"] as! String
                        let value = dict["value"] as! String
                        let weight_unit = dict["weight_unit"] as! String
                        if weight_unit == "1"{
                            unitdata = Double(value)!/2.205
                        }else {
                            unitdata = Double(value)!
                        }
                    self.value = dict["value"] as! String
                        let height =   Double(UserDefaults.standard.string(forKey: "heightcm") ?? "0") ?? 0
                        self.calcBMI(mass:unitdata, height:height)
                       
                        
                    }
                    self.tbt.reloadData()
                }
              
                
            }else {
                
            }
        }
        self.navigationController?.navigationBar.isHidden = false
    }
    @objc func add_weight(sender:UIButton){
        DispatchQueue.main.async {
        let mainController = self.storyboard?.instantiateViewController(withIdentifier: "WeightPickerViewViewController") as! WeightPickerViewViewController
//            mainController.deligate = self
            mainController.isselectd = true
        self.navigationController?.navigationBar.isHidden = true
        
        self.navigationController?.pushViewController(mainController, animated: true)
        }
    }
    
    
    func calcBMI (mass : Double, height : Double) -> String{
        
        //let myBmi = mass / (height * height)
        
        let bmi = mass / pow(height, 2)
        
        //let shortenedBmi = round(bmi) // Not good. It is celing function & makes 29.7299 to 30.0
        
        let shortenedBmi = String(format: "%.2f", bmi) // It rounds to 2
        //let shortenedBmi = String(format: "%1.0f", bmi) // It rounds to 0
        //let shortenedBmi = String(format: "%1.1f", bmi) // It rounds to 1
        
        var interpretation = ""
        
        if bmi > 25{
            
            interpretation = "Overweight"
        }
        //else if myBmi >= 18.5 && myBmi <= 25{
          else if bmi >= 18.5{
            interpretation = "Nomal Weight"
        }
        else
        {
            interpretation = "Underweight"
        }
        self.bmi = "\(bmi)"
        lavel = "\(interpretation)"
         
        
        
        //return "Your BMI is \(bmi). " + interpretation + " & BMI of a healthy guy is between 18.5 & 25"
        //return "Your BMI is " + String(bmi) + "." + interpretation + " & BMI of a healthy guy is between 18.5 & 25" // String(bmi) converts bmi data Type to String (Type Casting)
        
        return "Your BMI is \(shortenedBmi). \(interpretation) & BMI of a healthy guy is between 18.5 & 25"
    }
}
extension WeightdataVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return 1
        }else {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
            if modelget.dataWeight.count == 0{
               
                label.center = CGPoint(x: 200, y:400)
                label.textAlignment = .center
                label.text = "No Data Found"
                label.isHidden = true
                self.view.addSubview(label)
            }else {
                label.isHidden = true
                return modelget.dataWeight.count
            }
              
           
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let homecell = tbt.dequeueReusableCell(withIdentifier:"weightlistcell1") as! weightlistcell
//            let data = modelget.dataWeight[indexPath.row] as! NSDictionary
            homecell.datelbl.text! = date
            let value:Float = Float(self.value)!
//            let bmidata = self.bmi +
            let bmidata:Float = Float(self.bmi) ?? 0
         
            homecell.underweightlbl.text! =   "BMI "+String(format: "%.2f",Float(bmidata)) + " | " + (self.lavel)
            homecell.weightdatalbl1.text! = String(format: "%.2f",Float(value))
            return homecell
        } else {
            let homecell = tbt.dequeueReusableCell(withIdentifier:"weightlistcell") as! weightlistcell
            let modelgetdata = modelget.dataWeight[indexPath.row] as! NSDictionary
//
           // let date = Date()
//            let formatter = DateFormatter()
            let date2 = modelgetdata["updated"] as! String
            
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date3 = dateFormatter1.date (from: date2)
            dateFormatter1.dateFormat = "dd-MM-yyyy"
            let result2 = dateFormatter1.string(from: date3!)
           homecell.datedatalbl.text! = "\(result2)"
            let value:Float = Float(modelgetdata["value"] as! String)!
            let height =   Double(UserDefaults.standard.string(forKey: "heightcm") ?? "0") ?? 0.0
            var unitdata = 0.0
            let weight_unit = modelgetdata["weight_unit"] as! String
            if weight_unit == "1"{
                unitdata = Double(Float(value)/2.205)
            }else {
                unitdata = Double(Float(value))
            }
            self.calcBMI(mass:unitdata, height:height)
           
            let bmidata:Float = Float(self.bmi) ?? 0.0
            homecell.bmilabel.text = "BMI "+String(format: "%.2f",Float(bmidata)) + " | " + (self.lavel)
            homecell.weightdatalbl.text! = String(format: "%.2f",Float(value))
            return homecell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 284
        }else{
            return 85
            
        }
            
    }
    func convertDateFormater(_ date: String) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
            let date = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return  dateFormatter.string(from: date!)

        }
}
