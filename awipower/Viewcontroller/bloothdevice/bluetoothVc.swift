//
//  bluetoothVc.swift
//  awipower
//
//  Created by Srajan on 04/11/20.
//

import UIKit
import CoreBluetooth
import KRProgressHUD
class bluetoothVc: UIViewController {
    @IBOutlet weak var devicename:UILabel!
    var deviceselectname:String? = ""
    var centralManager: CBCentralManager!
    var heartRatePeripheral: CBPeripheral!
    override func viewDidLoad() {
        super.viewDidLoad()
        if deviceselectname != nil {
        devicename.text = deviceselectname
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
 
    

    @IBAction func cancel(sender: UIButton){
      remove()
    }
    @IBAction func connect_btnclick(sender: UIButton){

        remove()
    }
   
    
}
