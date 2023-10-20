//
//  BaseClassController.swift
//  DDM IOS
//
//  Created by PineSucceed MacMini1 on 05/02/20.
//  Copyright © 2020 PineSucceed MacMini1. All rights reserved.
//

import UIKit

class BaseClassController: UIViewController {
    var model1 = TrainModel()
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9438716496, green: 0.03420891981, blue: 0.004172750845, alpha: 1)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
//        let logo = UIImage(named: "menu-bg-2")
//        let imageView = UIImageView(image:logo)
//        self.navigationItem.titleView = imageView
        
        
//        let img = UIImage(named: "menu-bg-2")
//       self.navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.navigationBar.isHidden = false
    }
    
    func addSlideMenuButton() {
        
        let btnShowMenu = UIButton(type: .system)
        btnShowMenu.setImage(UIImage(named: "nav_icon"), for: .normal)
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
        btnShowMenu.tintColor = UIColor.white
     
        //        btnShowMenu.tintColor = UIColor(red: 119/255, green: 185/255, blue: 251/255, alpha: 1)
        
        btnShowMenu.addTarget(self, action:#selector(onSlideMenuButtonPressed(_:)), for: .touchUpInside)
        
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        navigationItem.leftBarButtonItem = customBarItem
    }
    
    func addBackButton() {
        
        let btnShowMenu = UIButton(type: .system)
        btnShowMenu.setImage(UIImage(named: "back_top_icon"), for: .normal)
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.tintColor = UIColor.white
        btnShowMenu.addTarget(self, action:#selector(btnBackClick), for: .touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        navigationItem.leftBarButtonItem = customBarItem
        model1.resetModel()
         
    }
//    
    @objc func btnBackClick()
    {
        self.navigationController?.popViewController(animated: true)
        
    }
    
//    
    @objc func onSlideMenuButtonPressed(_ sender: UIButton)
    {
        self.view.endEditing(true)
        
        if sender.tag == 10 {
            // To Hide Menu If it already there
            //    slideMenuItemSelected(at: -1, withIdentifire: [:])
            
            sender.tag = 0
            
            let viewMenuBack = view.subviews.last //as! UIView
            
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                var frameMenu: CGRect? = viewMenuBack?.frame
                frameMenu?.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack?.frame = frameMenu ?? CGRect.zero
                viewMenuBack?.layoutIfNeeded()
                
                // change for color
                viewMenuBack?.backgroundColor = UIColor.clear
            }, completion: {(_ finished: Bool) -> Void in
                viewMenuBack?.removeFromSuperview()
            })
            return
        }
        
        //  Converted to Swift 4 by Swiftify v4.1.6710 - https://objectivec2swift.com/
        
        sender.isEnabled = true
        sender.tag = 10
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "SideMenu") as! SideMenu
        
//        let menuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenu") as? SideMenu
        
        //        print(menuVC ?? "")
        
        menuVC.btnMenu = sender
        menuVC.delegate = self as? SlideMenuDelegate
        
        if let aView = menuVC.view {
            self.view.addSubview(aView)
        }
        
//        if let aVC = menuVC {
        
            addChild(menuVC)
//        }
        
        menuVC.view.layoutIfNeeded()
        menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            
            menuVC.view.frame = CGRect(x: 0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
            sender.isEnabled = true
            
        }, completion: {(_ finished: Bool) -> Void in
        })
    }
//    
//    
    func slideMenuItemSelected(at index: Int, withIdentifire identifire: [String: Any]) {
        
        
        if index > -1 && identifire.count > 0 {
            
            //            openViewControllerBased(onIdentifier: identifire["identifire"] as? String, indexNo1:index)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
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
