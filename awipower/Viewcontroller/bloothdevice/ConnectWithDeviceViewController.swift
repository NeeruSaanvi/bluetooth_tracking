//
//  ConnectWithDeviceViewController.swift
//  247Vitals
//
//  Created by PineSucceed Imac on 02/05/20.
//  Copyright © 2020 PineSucceed. All rights reserved.
//

import UIKit
import CoreBluetooth
import KRProgressHUD
import FirebaseAnalytics


class DeviceSearchTableViewCell: UITableViewCell {
  
    @IBOutlet weak var button_checkbox: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
  
    //    @IBOutlet weak var lblUdid: UILabel!
//    @IBOutlet weak var lblStatus: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class ConnectWithDeviceViewController: BaseClassController,CBPeripheralDelegate, CBCentralManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    //MARK: ADD_blutoothdeviceview:
    
    @IBOutlet weak var addblutoothdeviceview: UIView!
    @IBOutlet weak var popview: UIView!
    var characterStics : CBCharacteristic!
    
    var bluetoothname  = ""
    @IBOutlet weak var devicename:UILabel!
    static let shared = ConnectWithDeviceViewController()
    var timer : Timer!
    var timerGetData : Timer!
    var centralManager: CBCentralManager!
    var heartRatePeripheral: CBPeripheral!
    var screenType = 0
    //    let heartRateCharacteristicUUID = CBUUID(string: "FFF0")
    let serviceUdid = CBUUID(string: "0xFFF0")
    
    @IBOutlet weak var btnSearchDevice: UIButton!
    
    @IBOutlet weak var tableview: UITableView!
    var searchDeviceFlag = 0
    let arrayOfSearchDevice = NSMutableArray()
    var arrayOfSavedDevice = NSMutableArray()
    var connectDeviceInfo : NSData!
    //var totalSleep = 0
    
    var dicOfSleep = NSMutableDictionary()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      //  self.btnSearchDevice.setTitle("Search Device", for: .normal)
//        if(screenType == 0)
//        {
//            // add side menu
//            self.addSlideMenuButton()
//        }
//        let btn1 = UIButton(type: .custom)
//          btn1.frame = CGRect(x: 0, y: 0, width: 11640, height: 30)
//          btn1.setTitle("SCAN", for:.normal)
//          btn1.setTitleColor(#colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1), for: .normal)
//          btn1.titleLabel?.font =  UIFont(name:"Poppins-SemiBold", size: 16)
//          btn1.addTarget(self, action:#selector(searchDevice), for: .touchUpInside)
//          btn1.layer.cornerRadius = 5
//          btn1.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//         let addNew = UIBarButtonItem.init(customView: btn1)
 
 
//        let button1 = UIBarButtonItem(image: UIImage(named: "add_weight.png"), style: .plain, target: self, action:#selector(add_weight)) // action:#selector(Class.MethodName) for swift 3
// self.navigationItem.rightBarButtonItem  = addNew
//        button1.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     
            //self.addBackButton()
        //self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Bluetooth"
        
        if(UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDeviceArray) != nil)
        {
            self.tableview.isHidden = false
            let customBarItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(searchDevice(sender:)))
            
            navigationItem.rightBarButtonItem = customBarItem
            
            self.arrayOfSavedDevice.addObjects(from: UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDeviceArray) as! [Any])
        }
        else
        {
            self.tableview.isHidden = true
        }
        
        
        
        //MARK: hidedeviceconnection_hide
        addblutoothdeviceview.isHidden = true
        popview.isHidden = true
        
        TrainModel.sharedInstance().body_value_ab = 5
    }
    
    func connectWithDevice()
    {
        if(centralManager == nil)
        {
            centralManager = CBCentralManager(delegate: self, queue: nil)
        }
//        else if(ConnectWithDeviceViewController.shared.heartRatePeripheral != nil){
//            centralManager.connect(heartRatePeripheral!)
//        }
    }
    
    
    //MARK:- Search device delegates
    // status of phone Bluetooth
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
        case .poweredOn:
            print("central.state is .poweredOn")
            //Start scan bluettoth device
            //                        let heartRateServiceCBUUID = CBUUID(string: "0x180D")
            //                        let tmServiceCBUUID = CBUUID(string: "0x1809")
            //                        let hbServiceCBUUID = CBUUID(string: "0x1812")
            //                        let gaServiceCBUUID = CBUUID(string: "0x1800")
            //            let DiServiceCBUUID = CBUUID(string: "0x180A")
            //            let fmServiceCBUUID = CBUUID(string: "0x1826")
            //            let gsServiceCBUUID = CBUUID(string: "0x1801")
            //            let GlServiceCBUUID = CBUUID(string: "0x1808")
            //            let spServiceCBUUID = CBUUID(string: "0x1813")
            //            let phServiceCBUUID = CBUUID(string: "0x180E")
            //            let otServiceCBUUID = CBUUID(string: "0x1825")
            //            let imServiceCBUUID = CBUUID(string: "0x1802")
            
            //                        centralManager.scanForPeripherals(withServices: [heartRateServiceCBUUID,tmServiceCBUUID,hbServiceCBUUID,gaServiceCBUUID,DiServiceCBUUID,fmServiceCBUUID,gsServiceCBUUID,GlServiceCBUUID,spServiceCBUUID,phServiceCBUUID,otServiceCBUUID,imServiceCBUUID])
            //                        let option:[String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey: NSNumber(value: false)]
            //            centralManager.scanForPeripherals(withServices: nil, options: nil)
            //            UtilityClass.setUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral, value: peripheral)
            //            print(centralManager.retrieveConnectedPeripherals(withServices: [CBUUID.init(string: "976DD50D-0DCB-96DF-0E90-A94BFFCAA2FD")]))
            //            UUID(uuidString: "976DD50D-0DCB-96DF-0E90-A94BFFCAA2FD")
            
            timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { (timer) in
                self.stopSearch()
            }
            
            if(UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral) != nil && UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral) as! String != "" )
            {
                
                //                       print(UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral) as! String)
                //                    self.btnSearchDevice.setTitle("Search Device", for: .normal)
                //SVProgressHUD.show(withStatus: "Please wait...\nWe are connecting device")
                KRProgressHUD.showMessage("Please wait...\nWe are connecting device")
                let arrayOfPeripheral = centralManager.retrievePeripherals(withIdentifiers: [UUID(uuidString: UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral) as! String )!])
                //                       print(arrayOfPeripheral);
                if(arrayOfPeripheral.count > 0){
                    ConnectWithDeviceViewController.shared.heartRatePeripheral = arrayOfPeripheral[0]
                    centralManager.connect(arrayOfPeripheral[0])
                }
            }
            else{
                // self.btnSearchDevice.setTitle("Searching Device", for: .normal)
                KRProgressHUD.showMessage("Please wait...\nWe are searching device")
               // SVProgressHUD.show(withStatus: "Please wait...\nWe are searching device")
                centralManager.scanForPeripherals(withServices: nil)
            }
            
            
        //            self.connectWithDevice()
        @unknown default:
            print("error")
        }
    }
    
    
    func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //                print(peripheral)
        #if DEBUG
        print(peripheral.name ?? "no name")
        #endif
        //                print(RSSI);
        //        '' feo
        //        if(peripheral.identifier.uuidString == "8647C7DE-A768-5C94-1EBE-63A2877A3AC1")
        if (peripheral.name != nil && (peripheral.name!.contains("TZLJ") || peripheral.name!.contains("EMS") || peripheral.name!.contains("ADT")))
        {
            KRProgressHUD.dismiss()
            arrayOfSearchDevice.add(peripheral)
            self.tableview.reloadData()
            timer.invalidate()
        }
    }
    
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected!")
        //            if peripheral == self.heartRatePeripheral
        //            {
        //        self.btnSearchDevice.setTitle("Search device", for: .normal)
        
        peripheral.delegate = self
        peripheral.discoverServices(nil)
        
        
        //            }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {
            
            //            self.btnSearchDevice.setTitle("Search Device", for: .normal)
            //            SVProgressHUD.showError(withStatus: "Fail to get services of device, Please try again")
            return }
        ConnectWithDeviceViewController.shared.heartRatePeripheral = peripheral

        for service in services {
            //            print(service)
            if(service.uuid.uuidString == "FE50")
            {
//                heartRatePeripheral.discoverServices([service.uuid])
                
                
                timer.invalidate()
//                SVProgressHUD.showSuccess(withStatus: "Device Connected")
                KRProgressHUD.dismiss()
                
                peripheral.discoverCharacteristics(nil, for: service)
            }
            //            break
            //             peripheral.discoverServices([heartRateServiceUUID])
        }
    }
    
    
    func stopSearch()
    {
        KRProgressHUD.showMessage("Fail to connect with device, Please try again")
        //        centralManager.stopScan()
        searchDeviceFlag = 0
        if(tableview != nil)
        {
            tableview.reloadData()
            if(self.arrayOfSavedDevice.count == 0)
            {
               // self.tableview.isHidden = true
            }
        }
        
        timer.invalidate()
    }
    
    //MARK:- GET data delegates
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService,
                    error: Error?) {
        guard let characteristics = service.characteristics else {
            //            self.btnSearchDevice.setTitle("Search Device", for: .normal)
            //            SVProgressHUD.showError(withStatus: "Fail to get services of device, Please try again")
            return
            
        }
        
        
        
        for characteristic in characteristics {
            #if DEBUG
            print(characteristic)
            #endif
            
            if(characteristic.uuid.uuidString == "FE51")
            {
                ConnectWithDeviceViewController.shared.characterStics = characteristic
                ConnectWithDeviceViewController.shared.heartRatePeripheral.setNotifyValue(true, for: characteristic)
            }
//            var checkSum:  [UInt8] = [0x09]
            
//            NSData *dataC = [NSData dataWithBytes:&data length:8];
//            var command = CommandModel.init().instruct
            
//            let dataC = Data(bytes:&command, count: 8)
            
//            heartRatePeripheral.writeValue(dataC, for: characteristic, type: .withResponse)
//            long long command = 0xa5;
//            NSData *dataC = [NSData dataWithBytes:&command length:1];
//            [peripheral writeValue:dataC forCharacteristic:cha type:CBCharacteristicWriteWithResponse];
            
           
            
          
        }
        
        
//        for (CBCharacteristic *characteristic in service.characteristics) {
//            [peripheral readValueForCharacteristic:characteristic];
//            if ([characteristic.UUID.UUIDString isEqualToString:@"FE51"]) { //对应通道特征
//                [peripheral setNotifyValue:YES forCharacteristic:characteristic];//收到蓝牙设备的通知
//                [_characteristics setObject:characteristic forKey:[peripheral.identifier UUIDString]];
//                [_connectDelegate bluetoothDeviceDiscoveredService:peripheral];
//                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//                _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//                dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0),5 * NSEC_PER_SEC,0);
//                dispatch_source_set_event_handler(_timer, ^{
//                    [self sendData:self.heartBeatComm.instruct ToPeripheral:self.connectedDevice];
//                });
//                dispatch_resume(_timer);
//                return;
//            }
//        }
        
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        //        print("isNotifying: \(characteristic.isNotifying)")
        //        print(characteristic.value ?? "no value")
        if(characteristic.value?.count ?? 0 > 0){
            //            let buffer = [UInt8](characteristic.value!)
            //            print("buffer", buffer)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?) {
        

//                        var deviceData = yhDeviceData()
//                        deviceData = bleSDK_1810G.sharedManager()?.dataParsing(with: characteristic.value) as! yhDeviceData
//
//                        print("SDK", deviceData.dicData as Any)
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor descriptor: CBDescriptor, error: Error?) {
        
    }
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
                print(characteristic)
                print("write")
    }
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?)
    {
        KRProgressHUD.showMessage("Fail to connect, Please try again")
        //        self.btnSearchDevice.setTitle("Search Device", for: .normal)
    }
    
  
    
    
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        // Start scanning again
        //            print("Central scanning for", ParticlePeripheral.particleLEDServiceUUID);
        //            centralManager.scanForPeripherals(withServices: nil,
        //                                              options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
//        if(centralManager.)
        centralManager.connect(peripheral)
        
    }
    
    func checkSum(data: [UInt8]) -> UInt8 {
        
        var sum = 0
        for i in 0..<data.count {
            sum += Int(data[i])
        }
        let retVal = sum & 0xFF
        return UInt8(retVal)
    }
    
    func checkSum1(data: [UInt16]) -> UInt16 {
        
        var sum = 0
        for i in 0..<data.count {
            sum += Int(data[i])
        }
        let retVal = sum & 0xFF
        return UInt16(retVal)
    }
  
    
    func swap(s: UInt16) -> UInt16 {
        var temp = s << 8;
        temp |= (s >> 8)
        return temp
    }
    
    
    func sendData(data: CLongLong)
    {
        var dataTemp = data
        let dataC = Data(bytes:&dataTemp, count: 8)
        ConnectWithDeviceViewController.shared.heartRatePeripheral.writeValue(dataC, for: ConnectWithDeviceViewController.shared.characterStics, type: .withResponse)
    }
    
//    -(void)sendData:(long long)data ToPeripheral:(CBPeripheral *)peripheral{
//      //  CBCharacteristic *cha = (CBCharacteristic *)[_characteristics objectForKey:[peripheral.identifier UUIDString]];
//        NSData *dataC = [NSData dataWithBytes:&data length:8];
//        NSLog(@"data %@", dataC);
//        [peripheral writeValue:dataC forCharacteristic:cha type:CBCharacteristicWriteWithResponse];
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    //MARK:- tableview delegate
    // Do any additional setup after loading the view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchDeviceFlag == 0)
        {
            return self.arrayOfSavedDevice.count
        }
        else{
            return self.arrayOfSearchDevice.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifire = "cellSearch"
//        if(searchDeviceFlag == 0)
//        {
//            identifire = "cellSave"
//        }
        
        
        let device = tableView.dequeueReusableCell(withIdentifier: identifire) as! DeviceSearchTableViewCell
        
        
        if(searchDeviceFlag == 0)
        {
            let dic =  self.arrayOfSavedDevice[indexPath.row] as! NSDictionary
            device.lblName.text = dic["name"] as? String
            
         
            let udid = UtilityClass.getUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral)
            if(udid != nil && (udid as! String) == device.lblName.text!)
            {
              //  device.lblStatus.text! = "Paired"
            }
            else
            {
                //device.lblStatus.text! = ""
            }
        }
        else{
            let peripheral =  self.arrayOfSearchDevice[indexPath.row] as! CBPeripheral
            device.lblName.text = peripheral.name
            
            
           // device.lblUdid.text = peripheral.identifier.uuidString
        }
        
        return device
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifire = "cellSearch"
        
        
        let device = tableView.dequeueReusableCell(withIdentifier: identifire) as! DeviceSearchTableViewCell
         
        if device.button_checkbox.isSelected == false {
            device.button_checkbox.isSelected = false
        }else {
            device.button_checkbox.isSelected = true
        }
          
        addblutoothdeviceview.isHidden = false
        let peripheral = self.arrayOfSearchDevice[indexPath.row] as! CBPeripheral
        devicename.text! = peripheral.name!
        addblutoothdeviceview.tag = indexPath.row
        popview.isHidden = false
    }
        
        
        
        
        
        
        
        
        
        
        //        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { (timer) in
        //                        self.stopSearch()
        //                    }
        //
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete && searchDeviceFlag == 0{
            
            let alert = UIAlertController(title: "", message: "Do you want to unpair device", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
                
                UIAlertAction in
                self.arrayOfSavedDevice.removeObject(at: indexPath.row)
                UtilityClass.setUserDefault(key: utilityObject.kDefaultConnectedDeviceArray, value: self.arrayOfSavedDevice.copy())
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }

            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            alert.show()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
    func savePeriferal(peripheral: CBPeripheral) {
        ConnectWithDeviceViewController.shared.heartRatePeripheral  = peripheral
        
        arrayOfSavedDevice.add (["name":peripheral.name,"uuid":peripheral.identifier.uuidString])
        
//        UtilityClass.setUserDefault(key: utilityObject.kDefaultConnectedDeviceArray, value: arrayOfSavedDevice.copy())
        ///UtilityClass.setUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral, value: peripheral.identifier.uuidString)
        searchDeviceFlag = 0
        if(tableview != nil)
        {
            tableview.reloadData()
        }
        
    }
    
    
    @IBAction func searchDevice(sender: Any)
    {
        //initialies Center Manager
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        UtilityClass.setUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral, value: nil)
        
        //            SVProgressHUD.show(withStatus: "Please wait...\nWe are searching device")
        //            centralManager.scanForPeripherals(withServices: nil)
        
       // self.navigationController?.view.makeToast("Please wait...\nWe are searching device")
        searchDeviceFlag = 1
        self.arrayOfSearchDevice.removeAllObjects()
        tableview.reloadData()
        tableview.isHidden = false
    }
    
    @IBAction func cancel(sender: UIButton){
        addblutoothdeviceview.isHidden = true
        popview.isHidden = true
    }
    @IBAction func connect_btnclick(sender: UIButton){
    
        let index = addblutoothdeviceview.tag
        if(searchDeviceFlag == 1)
        {
            let peripheral = self.arrayOfSearchDevice[index] as! CBPeripheral
            
            Comman.alertView(title:"Show Test", message:"\(peripheral.name ?? "no name")", object: self, cancelTitle: "Cancel")
                centralManager.stopScan()
                centralManager.connect(peripheral)
                self.savePeriferal(peripheral: peripheral)
                let mainController = self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as! UITabBarController
                self.navigationController?.navigationBar.isHidden = true
                self.navigationController?.pushViewController(mainController, animated: true)
        }
        else
        {
            
            Comman.alertView(title:"Show Test", message:"searchDeviceFlag == 3", object: self, cancelTitle: "Cancel")
            Analytics.logEvent(AnalyticsEventSignUp, parameters: [
                AnalyticsParameterMethod: method
            ])
            let dic = self.arrayOfSavedDevice[index] as! NSDictionary
            UtilityClass.setUserDefault(key: utilityObject.kDefaultConnectedDevicePeripheral, value: dic["uuid"] as Any)
            
            connectWithDevice()
            
            //                SVProgressHUD.show(withStatus: "Please wait...\nWe are connecting device")
            //                let arrayOfPeripheral = centralManager.retrievePeripherals(withIdentifiers: [UUID(uuidString: dic["uuid"] as! String )!])
            //                if(arrayOfPeripheral.count > 0){
            //                    heartRatePeripheral = arrayOfPeripheral[0]
            //                    centralManager.connect(arrayOfPeripheral[0])
            //                }
            //                else
            //                {
            //                    SVProgressHUD.showError(withStatus: "Device not connected, Please try again")
            //                }
            
            let mainController = self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as! Tabbaarcontrollr
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.pushViewController(mainController, animated: true)
            //              self.navigationController?.popViewController(animated: true)
        }
        addblutoothdeviceview.isHidden = true
        popview.isHidden = true
        //        self.navigationController?.navigationBar.isHidden = true
        //        self.navigationController?.popViewController(animated: true)
        
        
        
        
        //remove()
    }
    
    
    @objc func select_btncheckbox(sender:UIButton){
        if sender.isSelected == true {
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }

    
    
    
    
    
    
    @IBAction func back_button (sender: UIButton){
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
}
