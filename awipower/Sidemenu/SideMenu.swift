//
//  SideMenu.swift
//  DDM IOS
//
//  Created by PineSucceed MacMini1 on 04/02/20.
//  Copyright © 2020 PineSucceed MacMini1. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import GoogleSignIn
import SDWebImage

protocol SlideMenuDelegate {
    
    func slideMenuItemSelected(at index: Int, withIdentifire identifire: [String: Any])
}

class SideMenu: BaseClassController,UITableViewDelegate,UITableViewDataSource {
    var btnCloseMenuOverlay: UIButton!
    var window: UIWindow?
    @IBOutlet weak var viewSideMenu: UIView!
    var delegate: SlideMenuDelegate!
    var btnCloseMenu:UIButton!
    var btnMenu: UIButton!
    var setprice = ""
    var arrayMenuItem = [[:]]
    var cellSelectedIndex = 0
    let tabbarcontroller = Tabbaarcontrollr()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Role Type 1 = seller and 2 = buyer
        
        // Do any additional setup after loading the view.
       // if(ModelProfile.shared.roll_type == rollType.buyer.rawValue)
       // {
            
            arrayMenuItem = [["name":"  Dashboard","image":"dashboard_menu_icon_shadow","identifier":"HomeListVC"],
                             ["name":"  MY Profile","image":"profile_menu_icon","identifier":"MyProfileVC"],
                             ["name":"  Weight","image":"weight_menu_icon","identifier":"WeightdataVC"],
                             ["name":"  Calorie","image":"calories_menu_icon","identifier":"CaloriesburnVC"],
                             ["name":"  My Data","image":"my_data_menu_icon","identifier":"MyDataVC"],
                             ["name":"  About us","image":"about_icon","identifier":"AboutusVC"],
                             ["name":"  Settings","image":"setting_menu_icon","identifier":"SettingVC"]]
            
            
        //}
//        else{
//
//            arrayMenuItem = [["name":"  Buyer List","image":"","identifier":"BuyerSeller"],
//                          //   ["name":"  Product List","image":"","identifier":"ProductList"],
//                             ["name":"  Order List","image":"","identifier":"OrderUnorderList"],
//                             ["name":"  Return Product List","image":"","identifier":"ReturnItemViewController"],
//                             ["name":"  Settings","image":"","identifier":"Settings"],
//                             ["name":"  Log Out","image":"","identifier":""]]
//
//        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(func_HideSideMenu))
        viewSideMenu.addGestureRecognizer(tap)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
            
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        
    }
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

           if let swipeGesture = gesture as? UISwipeGestureRecognizer {


               switch swipeGesture.direction {
               case UISwipeGestureRecognizer.Direction.right:
                       print("Swiped right")
                   

               case UISwipeGestureRecognizer.Direction.down:
                       print("Swiped down")
               case UISwipeGestureRecognizer.Direction.left:
                       print("Swiped left")
                   // close the side menu
                   btnCloseMenuOverlay = UIButton(type: .custom)
                   onCloseMenuClick(btnCloseMenuOverlay)
               case UISwipeGestureRecognizer.Direction.up:
                       print("Swiped up")
                   default:
                       break
               }
           }
       }
    
    @objc func methodCloseSide()
    {
        self.func_HideSideMenu()
    }
    
    @objc func func_HideSideMenu() {
        
        btnCloseMenuOverlay = UIButton(type: .custom)
        onCloseMenuClick(btnCloseMenuOverlay)
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()

            // Call the roundCorners() func right there.
       
        }
    // MARK:- Table view delegates
     
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
            }else {
                return self.arrayMenuItem.count
            }
       
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//            let headerView = UIView()
//            let headerCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell1") as! SideMenuCell
//            headerView.addSubview(headerCell)
//            return headerView
//        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            tableView.tableFooterView = UIView()
             let sideMenuCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell1") as! SideMenuCell
            let imageurl = "http://awi.pinesucceed.com/powerpassadmin/images/" + ModelProfile.shared.profile_image
             sideMenuCell.useriamge_show.sd_setImage(with: URL(string:imageurl), placeholderImage:UIImage(named:"user"))
            sideMenuCell.username.text! = ModelProfile.shared.first_name + ModelProfile.shared.last_name
             return sideMenuCell
            
        }   else {
            tableView.tableFooterView = UIView()
             let sideMenuCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
             sideMenuCell.labName.text = ((self.arrayMenuItem[indexPath.row] as NSDictionary)["name"] as! String)
            sideMenuCell.useriamge_show.image = UIImage(named: (self.arrayMenuItem[indexPath.row] as NSDictionary)["image"] as! String)
            self.cellSelectedIndex = indexPath.row
            if(self.cellSelectedIndex != indexPath.row){
                sideMenuCell.labName.textColor = #colorLiteral(red: 0.3882352941, green: 0.4156862745, blue: 0.4784313725, alpha: 1)
            }else{
                sideMenuCell.labName.textColor = #colorLiteral(red: 0.1019607843, green: 0.1450980392, blue: 0.1568627451, alpha: 1)
            }
             return sideMenuCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 180
         } else {
            
            var height : CGFloat = CGFloat()
            height = CGFloat(50)
            return height
        }
          
      
       
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.cellSelectedIndex = indexPath.row
        print(self.cellSelectedIndex)
        
        if indexPath.section == 0{
            
        }else {
        //        print("You selected cell #\(item[indexPath.row])!")
            
            let sideMenuCell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
                if(self.cellSelectedIndex != indexPath.row){
                    sideMenuCell.labName.textColor = #colorLiteral(red: 0.3882352941, green: 0.4156862745, blue: 0.4784313725, alpha: 1)
                }else{
                    sideMenuCell.labName.textColor = #colorLiteral(red: 0.1019607843, green: 0.1450980392, blue: 0.1568627451, alpha: 1)
                }
            //-1
        if(indexPath.row != self.arrayMenuItem.count){
            // move to selected controller
//            ["name":"  Dashboard","image":"dashboard_menu_icon","identifier":"HomeListVC"],
//                             ["name":"  MY Profile","image":"profile_menu_icon","identifier":"MyProfileVC"],
//                             ["name":"  Weight","image":"weight_menu_icon","identifier":"WeightdataVC"],
//                             ["name":"  Calorie","image":"calories_menu_icon","identifier":"CaloriesburnVC"],
//                             ["name":"  My Data","image":"my_data_menu_icon","identifier":"MyDataVC"],
//                             ["name":"  About us","image":"about_icon","identifier":""],
//                             ["name":"  Settings","image":"setting_menu_icon","identifier":""]]
            
            
            let dict =  ((self.arrayMenuItem[indexPath.row] as NSDictionary)["identifier"] as? String ?? "")
            print(dict)
            if  dict == "HomeListVC" {
                tabBarController?.selectedIndex = 0
            }else if dict == "MyProfileVC"{
                tabBarController?.selectedIndex = 4
            }
            else if dict == "WeightdataVC"{
                tabBarController?.selectedIndex = 1
            } else if dict == "CaloriesburnVC"{
                tabBarController?.selectedIndex = 2
            }else if dict == "MyDataVC"{
                tabBarController?.selectedIndex = 3
            }else if dict == "AboutusVC"{
            let vc = self.storyboard?.instantiateViewController(
                               withIdentifier:"AboutusVC") as! AboutusVC
                self.navigationController?.pushViewController(vc, animated:true)
            }else {
                let vc = self.storyboard?.instantiateViewController(
                               withIdentifier:"SettingVC") as! SettingVC
                self.navigationController?.pushViewController(vc, animated:true)
            }

            
            
            hideside_menu()
        }
       
        }
        
    }
//    // else{
//    let alertController1 = UIAlertController(title: "", message: "Are you sure you want to logout?", preferredStyle: .alert)
//
//    alertController1.addAction(UIAlertAction(title:NSLocalizedString("Yes", comment: ""), style: .default, handler: {(_ action1: UIAlertAction?) -> Void in
//
//
//        self.logout()
//
//    }))
//    alertController1.addAction(UIAlertAction(title: NSLocalizedString("No", comment: ""), style: .default, handler: nil))
//   // alertController1.show()
//    DispatchQueue.main.async {
//        //                self.present(alertController1, animated: true) {() -> Void in }
//    }
//}
  
    
    
    //        let navigation = self.storyboard?.instantiateViewController(withIdentifier: "navigation") as! UINavigationController
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         DispatchQueue.main.async {
            //  self.onSlideMenuButtonPressed(self.btnMenu)
        }
    }
    
    
    //        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //        appDel.window?.rootViewController = vc
    
    //
    //
    //        if(item[indexPath.row] == "0")
    //        {
    //            let registrationController = self.storyboard?.instantiateViewController(
    //                withIdentifier: "registrationViewController") as! registrationViewController
    //
    //            self.navigationController?.pushViewController(registrationController, animated: true)
    //
    //
    //        }
    //        else if(item[indexPath.row] == "1")
    //        {
    //            let login = self.storyboard?.instantiateViewController(
    //                withIdentifier: "Login") as! Login
    //
    //            self.navigationController?.pushViewController(login, animated: true)
    //
    //
    //        }
    //        else{
    //            let addProduct = self.storyboard?.instantiateViewController(
    //                withIdentifier: "addProduct") as! addProduct
    //
    //            self.navigationController?.pushViewController(addProduct, animated: true)
    //
    //        }
    
    
    //
        @objc func hideside_menu() {
    
            btnCloseMenu = UIButton(type: .custom)
    
            onCloseMenuClick(btnCloseMenu)
    
        }
    
    
        func onCloseMenuClick(_ button: UIButton?) {
            //        print(button?.tag ?? "")
    
//            btnMenu?.tag = 0
//
//
//            if delegate != nil {
//
//                //            print((button?.tag)!)
//
//                var index: Int = (button?.tag)!
//
//                if button == btnCloseMenu {
//                    index = -1
//                }
//                if index < 0 {
//                    delegate.slideMenuItemSelected(at: index, withIdentifire: [:])
//                } else {
//                    delegate.slideMenuItemSelected(at: index, withIdentifire: (arrayMenuItem[index] as! NSDictionary) as! [String : Any])
//                }
//            }
            
            print(button?.tag ?? "")
                     
                     btnMenu.tag = 0
    //
    //               if(button?.tag == 0){
    //                  / delegate = nil
    //               }
    //
                     if delegate != nil {
                         
                         var index: Int = (button?.tag)!
                         
                         if button == btnCloseMenuOverlay {
                             index = -1
                         }
                         if index < 0 {
                             delegate.slideMenuItemSelected(at: index, withIdentifire: [:])
                         } else {
                            delegate.slideMenuItemSelected(at: index, withIdentifire: (arrayMenuItem[index] as! NSDictionary) as! [String : Any])
                         }
                    }
                     
                     UIView.animate(withDuration: 0.3, animations: {() -> Void in
                         self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                         self.view.layoutIfNeeded()
                         self.view.backgroundColor = UIColor.clear
                     }, completion: {(_ finished: Bool) -> Void in
                         self.view.removeFromSuperview()
                       self.removeFromParent()
                     })
            
            
            
            
            
        }
          //  }
    
    //
    //
    //
    //        UIView.animate(withDuration: 0.3, animations: {() -> Void in
    //            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    //            self.view.layoutIfNeeded()
    //            self.view.backgroundColor = UIColor.clear
    //        }, completion: {(_ finished: Bool) -> Void in
    //            self.view.removeFromSuperview()
    //            self.removeFromParent()
    //        })
    //
    //
    //
    //    }
    //
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
