//
//  SettingVCViewController.swift
//  awipower
//
//  Created by Srajan on 12/11/20.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import GoogleSignIn
class SettingCell: UITableViewCell {
  
    @IBOutlet weak var logoutbutton: UIButton!
    @IBOutlet weak var buttonswitch: UISwitch!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var changesegment: UISegmentedControl!
    
    @IBOutlet weak var right_nowbutton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class SettingVC: BaseClassController{
   
    var listarrr = ["Change Password","Notification","Term & Condtions","Weight Unit","Height Unit","Time Format"]
    
    @IBOutlet weak var tbt:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         addBackButton()
        
        self.navigationItem.title = "Settings"
        self.tbt.tableFooterView = UIView()
    }
    
    
    
    
    @objc func toggleValueChanged(_ toggle: UISwitch) {
        if toggle.isOn == true {
        toggle.thumbTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else {
            toggle.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1)
        }
        
        
    }
    
    
    
}
extension SettingVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  section == 0{
            return listarrr.count
        }else {
            return 1
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let settingcell = tbt.dequeueReusableCell(withIdentifier:"SettingCell") as! SettingCell
            settingcell.changesegment.isHidden = true
            settingcell.right_nowbutton.isHidden = true
            settingcell.buttonswitch.isHidden = true
            let dict = listarrr[indexPath.row]
            if dict == "Change Password"{
                settingcell.right_nowbutton.isHidden = false
            }else if dict == "Notification"{
                settingcell.buttonswitch.isHidden = false
            }else if dict == "Term & Condtions"{
                settingcell.right_nowbutton.isHidden = false
            }else if dict == "Weight Unit" {
                settingcell.changesegment.isHidden = false
            }else if dict == "Height Unit" {
                settingcell.changesegment.isHidden = false
            }else {
                settingcell.changesegment.isHidden = false
            }
            settingcell.lblName.text! = listarrr[indexPath.row]
            
            settingcell.buttonswitch.addTarget(self, action: #selector(toggleValueChanged(_:)), for: .valueChanged)
        return settingcell
    }else{
    let settingcell = tbt.dequeueReusableCell(withIdentifier:"SettingCell1") as! SettingCell
        settingcell.logoutbutton.addTarget(self, action:#selector(logout), for:.touchUpInside)
    return settingcell
    }
    
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 55
        }else{
            return 110
        }
       
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = listarrr[indexPath.row]
        if dict == "Change Password"{
            
            if let change_password = self.storyboard?.instantiateViewController(withIdentifier:"ChangePasswordVC") as? ChangePasswordVC {
            self.navigationController?.pushViewController(change_password, animated:true)
            }
            
        }else if dict == "Notification"{
            
        }else if dict == "Term & Condtions"{
            
        }else if dict == "Weight Unit" {
            
        }else if dict == "Height Unit" {
            
        } else {
            
        }
    }
    
    
    
    //MARK: Logout:
    
   // Logout from application
    @objc func logout()
    {
        OperationQueue.main.addOperation {
            
           // ModelProfile.shared.()
            // logout from google
            GIDSignIn.sharedInstance().signOut()

            // logout from facebook
            let loginManager = LoginManager()

            loginManager.logOut()

                //Model_ProfileMerchant.shared.arrMerchant = NSMutableArray();
           //  remove default data
            UserDefaults.standard.set(nil, forKey: utilityObject.kDefaultUserDetail)
            
            
        }
        DispatchQueue.main.async {
          //  let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.tabBarController?.tabBar.isHidden = true
            self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.setViewControllers([rootViewController], animated: true)
        }
    }
    
}
