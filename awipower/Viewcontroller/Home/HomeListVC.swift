//
//  HomeListVC.swift
//  awipower
//
//  Created by Srajan on 04/11/20.
//

import UIKit
import CoreBluetooth

class homelistcell:UITableViewCell{
    @IBOutlet weak var dicreasebtn: UIButton!
    @IBOutlet weak var imgselectedimage: UIImageView!
    @IBOutlet weak var increasebtn: UIButton!
    @IBOutlet var lblType: UILabel!
    @IBOutlet var lblValue: UILabel!
    


    override func awakeFromNib() {

    }
}

class HomeListVC: BaseClassController {
    
    
    
    @IBOutlet weak var vip_view: UIView!
    var countdata = ""
    @IBOutlet weak var professonalview: UIView!
    @IBOutlet weak var relaxview: UIView!
    @IBOutlet weak var cardioburnview: UIView!
    @IBOutlet weak var strengthview: UIView!
    @IBOutlet weak var fatburnview: UIView!
    @IBOutlet weak var pausetimelbl: UILabel!
    @IBOutlet weak var pulsetime: UILabel!
    var callback : ((Int)->())?
    @IBOutlet weak var tbt: UITableView!
    var counter = 0
    var working_time = 0
    var pause_time = 0
    var paulse_time = 0
    var ramp_down = 0
    var ramp_up = 0
    var Frequency_time = 0
    var Pulse_Width = 0
    var isseletedindex = -1
    var isseletedtpostion = false
    var typeofselected = ""

    @IBOutlet weak var show_instructionlbl: UILabel!
    @IBOutlet weak var vp_btn: UIButton!
    @IBOutlet weak var professar_btn: UIButton!
    @IBOutlet weak var relax_btn: UIButton!
    @IBOutlet weak var strength_btn: UIButton!
    @IBOutlet weak var cardio_btn: UIButton!
    @IBOutlet weak var fatburnbtn: UIButton!
    @IBOutlet weak var roundeview: UIView!
    
    @IBOutlet weak var instoructionview: UIView!
    
    // array of value
    let arrarOfValue = NSMutableArray()
    
    var typemode = 0
    var btManager = ConnectWithDeviceViewController()
    let model = TrainModel()
    let profile_model = ModelProfile()
        override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        self.navigationItem.title = ""
        tbt.tableFooterView = UIView()
    
        let button1 = UIBarButtonItem(image: UIImage(named: "bluetooth.png"), style: .plain, target: self, action:#selector(blutooht_btn)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
        button1.tintColor = UIColor.white
        working_time = 20
        pause_time = 2
        paulse_time = 2
        ramp_down = 80
        ramp_up = 80
        self.arrarOfValue.add(["name":"Pulse Time(s)","value":"4"])
        self.arrarOfValue.add(["name":"Pause Time(s)","value":"4"])
        self.arrarOfValue.add(["name":"Working Time(M)","value":"20"])
        self.arrarOfValue.add(["name":"Frequency Time(HZ)","value":"65"])
        self.arrarOfValue.add(["name":"Pulse Width(s)","value":"360"])
        self.arrarOfValue.add(["name":"Ram Down(s)","value":"4"])
        self.arrarOfValue.add(["name":"Ram Up (s)","value":"0"])
        tbt.reloadData()
        TrainModel.sharedInstance().averageValue = 50
        TrainModel.sharedInstance().body_value_ab = 50
        TrainModel.sharedInstance().body_value_arm = 50
        TrainModel.sharedInstance().body_value_back = 50
        TrainModel.sharedInstance().body_value_hip = 50
            
      
        
    }
    
    func view_without_delected(){
        professonalview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        relaxview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cardioburnview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        strengthview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        fatburnview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        fatburnview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        vip_view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        fatburnview.layer.cornerRadius = 15
        fatburnview.clipsToBounds = true
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height:0))
        imageView.contentMode = .scaleAspectFit

        let image = UIImage(named: "header_logo-1.png")
        imageView.image = image
        navigationItem.titleView = imageView
      }
//   
    override func viewWillAppear(_ animated: Bool) {
    self.tabBarController?.tabBar.isHidden = false
    self.navigationController?.navigationBar.isHidden = false
        self.view_without_delected()
   //     ConnectWithDeviceViewController.shared.characterStics = characteristic
        if(UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral) != nil)
               {

//               let bleClassObject = ConnectWithDeviceViewController()
//                bleClassObject.connectWithDevice()
////                bleClassObject.connectWithDevice()
//                                bleClassObject.delegate = self
                ConnectWithDeviceViewController.shared.connectWithDevice()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (time) in
                    ConnectWithDeviceViewController.shared.connectWithDevice()
                }
                
//                ConnectWithDeviceViewController.shared.connectWithDevice()
               }

        self.model.resetModel()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isStatusBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // blueooth button action
    @IBAction func blutooht_btn(sender:UIButton){
        let mainController = self.storyboard?.instantiateViewController(withIdentifier: "ConnectWithDeviceViewController") as! ConnectWithDeviceViewController
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(mainController, animated: true)
    }
  
    
    // start button action
    @IBAction func sub_mit_btn(sender:UIButton){
        model.resetModel()
        
        let btTool = BlueToothCommTool(trainModel: model)
        let manager = ConnectWithDeviceViewController.shared
            model.mode_value_on = Int32(paulse_time)
            model.mode_value_off = Int32(pause_time)
            model.periodTotal = Int32(working_time)
            model.mode_value_frequency = Int32(Frequency_time)
            model.mode_value_wide = Int32(Pulse_Width)
            model.mode_value_dowm = Int32(ramp_down)
            model.mode_value_climb = Int32(ramp_up)
             
        if(fatburnbtn.isSelected)
        {
        model.modeType = Int32(TrainType.diet.rawValue)
        
        }
        if(cardio_btn.isSelected)
        {
            model.modeType = Int32(TrainType.relax.rawValue)
        }
        if(strength_btn.isSelected)
        {
            model.modeType = Int32(TrainType.detox.rawValue)
        }
        if(relax_btn.isSelected)
        {
            model.modeType = Int32(TrainType.recuperate.rawValue)
        }
        if(professar_btn.isSelected)
        {
            model.modeType = Int32(TrainType.aerobic.rawValue)
        }
        if(vp_btn.isSelected)
        {
            model.modeType = Int32(TrainType.aerobic.rawValue)
        }
        
    
        for comm in btTool.initialInstructs {
         manager.sendData(data: ((comm as AnyObject).instruct)!)
          }
        if isseletedtpostion == true {
      
          
            if(ConnectWithDeviceViewController.shared.heartRatePeripheral == nil)
            {
                Comman.alertView(title: "Bluetooth Conectivity", message: "Please connect power suite with application", object: self, cancelTitle: "Ok")
            } else {
                let mainController = self.storyboard?.instantiateViewController(withIdentifier: "CompleteBodypartVC") as! CompleteBodypartVC
                mainController.commTool = btTool
                mainController.model = model
                mainController.mode = typeofselected
                self.navigationController?.navigationBar.isHidden = false
                self.navigationController?.pushViewController(mainController, animated: true)
            }
         
        }else {
            Comman.alertView(title:"AWI", message:"Please select training mode", object:self, cancelTitle:"Ok")
        }
    
        
//            BlueToothCommTool *btTool = [[BlueToothCommTool alloc] initWithTrainModel:self.model];
//            __weak BlueToothManager *manager = [BlueToothManager sharedInstance];
//            for (CommandModel *comm in btTool.initialInstructs) {
//                [[BlueToothManager sharedInstance].btQueue  addOperationWithBlock:^{
//                    [manager sendData:comm.instruct ToPeripheral:manager.connectedDevice];
//                }];
//            }
            
    
        
        
//            let controRegReset = CommandModel()
//            controRegReset.regDesLow = 0x00
//            controRegReset.regControlData = 0x01
          
        
//
            // btManager.sendData(data: 8)
        
//         let btTool = BlueToothCommTool(trainModel: model!)
//         let manager = ConnectWithDeviceViewController.shared
//         for comm in btTool.initialInstructs {
//             manager.sendData(data: (comm) as! CLongLong)
//
//
//     }
            
        
            
//        mainController.submitfirsttime = "Submit"
//        mainController.workingtimeshow = working_time
//        mainController.rampdowndata = ramp_down
//        mainController.rampupdata = ramp_up
//        mainController.pause_data = pause_time
//        mainController.pulse_data = paulse_time
        
      
            
            //_wideRegControl mode_value_wide
            //_climbTimeRegControl mode_value_climb
            //_onTimeRegControl mode_value_on
            //_downTimeRegControl mode_value_dowm
            //_pauseTimeRegControl mode_value_off
        }
    
    
    
    //MARK:- WorkingTime(S)_count
    @objc func decreaseQuantity(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tbt.cellForRow(at: indexPath) as! homelistcell
        working_time = Int(cell.lblValue.text!) ?? 1
        working_time = working_time + 1
        cell.lblValue.text = String(working_time)
       // cell.wrokingtime.text = "\(count)"
    }
    //Increase quantity
    @objc func btnIncreaseQuantity(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tbt.cellForRow(at: indexPath) as! homelistcell
        working_time = Int(cell.lblValue.text!) ?? 1
          if(working_time > 1){
            working_time = working_time - 1
            cell.lblValue.text = String(working_time)
          }
      
    }
    
    
    
 
    
    @IBAction func selcted_btn_clicked(_ sender:UIButton) {
        cardio_btn.isSelected = false
        strength_btn.isSelected = false
        relax_btn.isSelected = false
        professar_btn.isSelected = false
        vp_btn.isSelected = false
        fatburnbtn.isSelected = false
//        updatearray = []
        if sender.tag == 0{
            isseletedindex = 0
            isseletedtpostion = true
            
            let popview = self.storyboard?.instantiateViewController(withIdentifier:"instructionVC") as! instructionVC
            popview.typeofselected  = "Fatburn"
            typeofselected = "Fatburn"
            self.addChild(popview)
            self.view.addSubview(popview.view)
            popview.didMove(toParent: self)
           // model?.trainType = diet
            model.modeType = Int32(TrainType.diet.rawValue)
        }else if sender.tag == 1 {
            isseletedindex = 1
            isseletedtpostion = true
            model.modeType = Int32(TrainType.relax.rawValue)
//            TrainType.init(rawValue: 6)
            arrarOfValue.replaceObject(at: 0, with: ["name":"Pulse Time(s)","value":"4"])
            arrarOfValue.replaceObject(at: 1, with: ["name":"Pause Time(s)","value":"0"])
            arrarOfValue.replaceObject(at: 2, with: ["name":"Working Time(M)","value":"20"])
            arrarOfValue.replaceObject(at: 3, with: ["name":"Frequency Time(HZ)","value":"7"])
            arrarOfValue.replaceObject(at: 4, with: ["name":"Pulse Width(s)","value":"360"])
            arrarOfValue.replaceObject(at: 5, with: ["name":"Ram Down(s)","value":"0"])
            arrarOfValue.replaceObject(at: 6, with: ["name":"Ram Up (s)","value":"0"])
            let popview = self.storyboard?.instantiateViewController(withIdentifier:"instructionVC") as! instructionVC
            popview.typeofselected = "Cardio"
            typeofselected = "Cardio"
            self.addChild(popview)
            self.view.addSubview(popview.view)
            popview.didMove(toParent: self)
        }else if sender.tag == 2 {
            isseletedtpostion = true
            
            arrarOfValue.replaceObject(at: 0, with: ["name":"Pulse Time(s)","value":"10"])
            arrarOfValue.replaceObject(at: 1, with: ["name":"Pause Time(s)","value":"4"])
            arrarOfValue.replaceObject(at: 2, with: ["name":"Working Time(M)","value":"20"])
            arrarOfValue.replaceObject(at: 3, with: ["name":"Frequency Time(HZ)","value":"85"])
            arrarOfValue.replaceObject(at: 4, with: ["name":"Pulse Width(s)","value":"360"])
            arrarOfValue.replaceObject(at: 5, with: ["name":"Ram Down(s)","value":"0"])
            arrarOfValue.replaceObject(at: 6, with: ["name":"Ram Up (s)","value":"0"])
            isseletedindex = 2
            let popview = self.storyboard?.instantiateViewController(withIdentifier:"instructionVC") as! instructionVC
            popview.typeofselected = "Stregnth"
            typeofselected = "Stregnth"
            self.addChild(popview)
            self.view.addSubview(popview.view)
            popview.didMove(toParent: self)
        }else  if sender.tag == 3{
            isseletedindex = 3
            isseletedtpostion = true
            arrarOfValue.replaceObject(at: 0, with: ["name":"Pulse Time(s)","value":"1"])
            arrarOfValue.replaceObject(at: 1, with: ["name":"Pause Time(s)","value":"1"])
            arrarOfValue.replaceObject(at: 2, with: ["name":"Working Time(M)","value":"20"])
            arrarOfValue.replaceObject(at: 3, with: ["name":"Frequency Time(HZ)","value":"100"])
            arrarOfValue.replaceObject(at: 4, with:  ["name":"Pulse Width(s)","value":"160"])
            arrarOfValue.replaceObject(at: 5, with: ["name":"Ram Down(s)","value":"0"])
            arrarOfValue.replaceObject(at: 6, with: ["name":"Ram Up (s)","value":"0"])
            let popview = self.storyboard?.instantiateViewController(withIdentifier:"instructionVC") as! instructionVC
            popview.typeofselected = "Relax"
            typeofselected = "Relax"
            self.addChild(popview)
            self.view.addSubview(popview.view)
            popview.didMove(toParent: self)
        }else if sender.tag == 4 {
            isseletedindex = 4
            isseletedtpostion = true
            arrarOfValue.replaceObject(at: 0, with: ["name":"Pulse Time(s)","value":"1"])
            arrarOfValue.replaceObject(at: 1, with: ["name":"Pause Time(s)","value":"1"])
            arrarOfValue.replaceObject(at: 2, with: ["name":"Working Time(M)","value":"20"])
            arrarOfValue.replaceObject(at: 3, with: ["name":"Frequency Time(HZ)","value":"85"])
            arrarOfValue.replaceObject(at: 4, with:  ["name":"Pulse Width(s)","value":"360"])
            arrarOfValue.replaceObject(at: 5, with: ["name":"Ram Down(s)","value":"40"])
            arrarOfValue.replaceObject(at: 6, with: ["name":"Ram Up (s)","value":"40"])
            
            let popview = self.storyboard?.instantiateViewController(withIdentifier:"instructionVC") as! instructionVC
            popview.typeofselected = "Professonal"
            typeofselected = "Professonal"
            self.addChild(popview)
            self.view.addSubview(popview.view)
            popview.didMove(toParent: self)
        }else if sender.tag == 5 {
            isseletedindex = 5
            isseletedtpostion = true
            arrarOfValue.replaceObject(at: 0, with: ["name":"Pulse Time(s)","value":"2"])
            arrarOfValue.replaceObject(at: 1, with: ["name":"Pause Time(s)","value":"2"])
            arrarOfValue.replaceObject(at: 2, with: ["name":"Working Time(M)","value":"20"])
            arrarOfValue.replaceObject(at: 3, with: ["name":"Frequency Time(HZ)","value":"85"])
            arrarOfValue.replaceObject(at: 4, with:  ["name":"Pulse Width(s)","value":"360"])
            arrarOfValue.replaceObject(at: 5, with: ["name":"Ram Down(s)","value":"30"])
            arrarOfValue.replaceObject(at: 6, with: ["name":"Ram Up (s)","value":"30"])
        
            let popview = self.storyboard?.instantiateViewController(withIdentifier:"instructionVC") as! instructionVC
            popview.typeofselected = "Vip"
            typeofselected = "Vip"
            self.addChild(popview)
            self.view.addSubview(popview.view)
            popview.didMove(toParent: self)
        }
//        arrarOfValue.add(updatearray)
       
        tbt.reloadData()
        sender.isSelected = true
    }
    
    
    
  
 
}

extension HomeListVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrarOfValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homecell = tbt.dequeueReusableCell(withIdentifier:"homelistcell") as! homelistcell
        homecell.increasebtn.tag = indexPath.row
        homecell.dicreasebtn.tag = indexPath.row
        homecell.dicreasebtn.addTarget(self, action: #selector(decreaseQuantity), for:.touchUpInside)
         homecell.increasebtn.addTarget(self, action: #selector(btnIncreaseQuantity), for:.touchUpInside)
        
        homecell.increasebtn.isSelected = false
        homecell.dicreasebtn.isSelected = false
        homecell.increasebtn.isSelected = false
        homecell.increasebtn.isUserInteractionEnabled = false
        homecell.dicreasebtn.isUserInteractionEnabled = false
        homecell.imgselectedimage.image = UIImage(named:"uncheck")
        

        if(isseletedindex != -1 && indexPath.row < 3)
        {
            
//            if indexPath.row == 0 {
//                arrarOfValue.add(<#T##anObject: Any##Any#>)
//            }else if indexPath.row == 1{
//                
//            }else if indexPath.row == 2 {
//                
//            }else if indexPath.row == 3 {
//                
//            }
            homecell.increasebtn.isSelected = true
            homecell.dicreasebtn.isSelected = true
            homecell.increasebtn.isSelected = true
            homecell.imgselectedimage.image = UIImage(named:"check")
            homecell.increasebtn.isUserInteractionEnabled = true
            homecell.dicreasebtn.isUserInteractionEnabled = true
        }
        
        if (isseletedindex == 4) && (indexPath.row == 5 || indexPath.row == 6){
            homecell.increasebtn.isSelected = true
            homecell.dicreasebtn.isSelected = true
            homecell.increasebtn.isSelected = true
            homecell.imgselectedimage.image = UIImage(named:"check")
            homecell.increasebtn.isUserInteractionEnabled = true
            homecell.dicreasebtn.isUserInteractionEnabled = true
        }
        
        
        if isseletedindex == 5 && (indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6){
            homecell.increasebtn.isSelected = true
            homecell.dicreasebtn.isSelected = true
            homecell.increasebtn.isSelected = true
            homecell.imgselectedimage.image = UIImage(named:"check")
            homecell.increasebtn.isUserInteractionEnabled = true
            homecell.dicreasebtn.isUserInteractionEnabled = true
        }

        homecell.lblType.text = (arrarOfValue[indexPath.row] as! NSDictionary)["name"] as? String

        homecell.lblValue.text = (arrarOfValue[indexPath.row] as! NSDictionary)["value"] as? String
        if let dictnamevalue = arrarOfValue[indexPath.row] as? NSDictionary {
            if dictnamevalue["name"] as? String == "Pulse Time(s)"{
                paulse_time =  Int(dictnamevalue["value"] as! String)!
            }
            else if dictnamevalue["name"] as? String == "Pause Time(s)"{
                pause_time =  Int(dictnamevalue["value"] as! String)!
            }
            else if dictnamevalue["name"] as? String  == "Working Time(M)"{
                working_time =  Int(dictnamevalue["value"] as! String)!
            }
            else if dictnamevalue["name"] as? String  == "Frequency Time(HZ)"{
                Frequency_time =  Int(dictnamevalue["value"] as! String)!
            }
            else if dictnamevalue["name"] as? String  == "Pulse Width(s)"{
                Pulse_Width =  Int(dictnamevalue["value"] as! String)!
            }
            else if dictnamevalue["name"] as? String  == "Ram Down(s)"{
                ramp_down =  Int(dictnamevalue["value"] as! String)!
            }else if dictnamevalue["name"] as? String  == "Ram Up"{
                ramp_up =  Int(dictnamevalue["value"] as! String)!
            }
            
        }
    
        
        return homecell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
        
    }
}
