//
//  PickerClass.swift
//  TMA
//
//  Created by PineSucceed MacMini1 on 12/04/18.
//  Copyright © 2018 PineSucceed MacMini1. All rights reserved.
//




//protocol PickerClassDelegate:class
//{
//    func datePickerValue(_ datePicker: UIDatePicker?,datePickerKey:String)
//    func pickervalue(_ picker: UIPickerView?, selectedValue:String,selected_Id:String,pickerKey:String)
//}


import Foundation
import UIKit
import SDWebImage



class PickerClass: NSObject, UIPickerViewDelegate, UIPickerViewDataSource
{
   
    var pickerArray = NSArray()
    
    var str_Pickerkey = String()
    var str_Pickerkey2 = String()
    var str_SelectedCountryCode = ""
    var str_SelectedCountryId = ""

    var picker = UIPickerView()
    
    
    static let sharedinstance = PickerClass()

    //    MARK:- showDatePicker
    func showDatePicker(completionHandler:@escaping (UIDatePicker, Any)->()) -> UIDatePicker
    {
        let datePicker = UIDatePicker()
       // datePicker.maximumDate = Date()
        datePicker.datePickerMode = .date
        
        let title = UIDevice.current.orientation.isLandscape ? "\n\n\n\n\n\n\n\n\n" : "\n\n\n\n\n\n\n\n\n\n\n\n"
       
        DispatchQueue.main.async(execute: {() -> Void in
            
            let datePickerContainer = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
            datePickerContainer.view.addSubview(datePicker)
            datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in

                completionHandler(datePicker,datePicker.date)
                
            }))

            datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                
            }))
       
            datePickerContainer.show()
//            let topWindow = UIWindow(frame: UIScreen.main.bounds)
//            topWindow.rootViewController = UIViewController()
//            topWindow.windowLevel = UIWindow.Level.alert + 0.8
//
//            topWindow.makeKeyAndVisible()
//            topWindow.rootViewController?.present(datePickerContainer, animated: true, completion: {})
            
        });
        
        return datePicker;
    }
    
    //MARK:- upPickerWithTwoKeyupPickerWithTwoKey
    
    func upPickerWithTwoKey(withArray array: NSArray, withkey key1: String, withkey key2: String, withTag tag: Int, completionHandler:@escaping (UIPickerView, Any)->())
    {    //    MARK:- upPickerShow
       
            if(array.count > 0)
            {
                pickerArray = array
                ////            print("value of pickerArray",pickerArray)
                str_Pickerkey = key1
                str_Pickerkey2 = key2
                
                let datePickerContainer = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
                
                let margin:CGFloat = 10.0
                
                
                var width = datePickerContainer.view.bounds.size.width - margin * 4.0
                if (UIDevice.current.userInterfaceIdiom == .pad){
                    width = 270
                }
                
                
                let rect = CGRect(x: margin, y: margin, width:width, height: 200)
                
                picker = UIPickerView (frame:rect)
                picker.tag = tag
                picker.delegate = self
                datePickerContainer.view.addSubview(picker)
                
                datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    completionHandler(self.picker,self.pickerArray[self.picker.selectedRow(inComponent: 0)])
                    
                    
                }))
                
                datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    
                }
                ))
                
                if array.count > 0
                {
                    
                    
                    let topWindow = UIWindow(frame: UIScreen.main.bounds)
                    
                    
                    if let popoverController = datePickerContainer.popoverPresentationController {
                        
                        popoverController.sourceView = topWindow
                        popoverController.sourceRect =  CGRect(x:topWindow.bounds.midX, y: topWindow.bounds.midY, width: 0, height: 0)
                        popoverController.permittedArrowDirections = []
                        
                    }
                    datePickerContainer.show()
                    
                }
            }
        }
    
    
    
    
    //    MARK:- upPickerShow
    func upPickerShow(withArray array: NSArray, withkey key1: String, withTag tag: Int, completionHandler:@escaping (UIPickerView, Any)->())
    {
        
    if(array.count > 0)
     {
        pickerArray = array
        ////            print("value of pickerArray",pickerArray)
        str_Pickerkey = key1

        let datePickerContainer = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)

        let margin:CGFloat = 10.0
    
    
    var width = datePickerContainer.view.bounds.size.width - margin * 4.0
    if (UIDevice.current.userInterfaceIdiom == .pad){
        width = 270
    }
    
    
     let rect = CGRect(x: margin, y: margin, width:width, height: 200)
    
        picker = UIPickerView (frame:rect)
        picker.tag = tag
        picker.delegate = self
        datePickerContainer.view.addSubview(picker)
        
        datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
             completionHandler(self.picker,self.pickerArray[self.picker.selectedRow(inComponent: 0)])
            
            
        }))
        
        datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
            
        }
        ))

        if array.count > 0
        {
            
            
            let topWindow = UIWindow(frame: UIScreen.main.bounds)

            
            if let popoverController = datePickerContainer.popoverPresentationController {
                
                popoverController.sourceView = topWindow
                popoverController.sourceRect =  CGRect(x:topWindow.bounds.midX, y: topWindow.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
                
            }
            datePickerContainer.show()

           }
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerArray.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        //            print("picker tag is:-",pickerView.tag)

        if (str_Pickerkey == "")
        {
            return pickerArray[row] as? String
        }
        else if(str_Pickerkey2 == "")
        {
           
            let dicOfValue: NSDictionary = pickerArray[row] as! NSDictionary

            return dicOfValue[str_Pickerkey] as? String
        }
        else
        {
            let dicOfValue: NSDictionary = pickerArray[row] as! NSDictionary
            
            return dicOfValue[str_Pickerkey] as? String ?? "" + "\n" +  String(dicOfValue[str_Pickerkey2] as! String)
        }

    }
    
}


class PickerClassforView: NSObject,UIPickerViewDelegate, UIPickerViewDataSource
    
{
    
    var pickerArray = NSArray()
    var str_Pickerkey = String()
    var str_SelectedCountryCode = ""
    var str_SelectedCountryId = ""
    
    var picker = UIPickerView()
    
    
    static let sharedinstance = PickerClassforView()
    
    //    MARK:- showDatePicker
    func showDatePicker(completionHandler:@escaping (UIDatePicker, Any)->()) -> UIDatePicker
    {
            let datePicker = UIDatePicker()
                    //datePicker.maximumDate = Date()
                    datePicker.datePickerMode = .date
            
            var title = UIDevice.current.orientation.isLandscape ? "\n\n\n\n\n\n\n\n\n" : "\n\n\n\n\n\n\n\n\n\n\n\n"
            //  Will only execute if the system is having iOS 14 or greater
            if #available(iOS 14, *) {
                datePicker.preferredDatePickerStyle = .inline
                
                title = UIDevice.current.orientation.isLandscape ? "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" : "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
                
            }
            
            
    //        DispatchQueue.main.async(execute: {() -> Void in
                let datePickerContainer = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
                datePickerContainer.view.addSubview(datePicker)
                datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    
                    completionHandler(datePicker,datePicker.date)
                }))
                
                datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                    
                }))
                
                let topWindow = UIWindow(frame: UIScreen.main.bounds)
    //            topWindow.rootViewController = UIViewController()
    //        topWindow.windowLevel = UIWindow.Level.alert + 0.8
                
    //            topWindow.makeKeyAndVisible()
                
                if let popoverController = datePickerContainer.popoverPresentationController {
                    
                    popoverController.sourceView = topWindow
                    popoverController.sourceRect =  CGRect(x:topWindow.bounds.height/2 , y: topWindow.bounds.width/2 , width: 0, height: 0)
                    
    //                popoverController.sourceRect = CGRect(x:topWindow.bounds.midX, y: topWindow.bounds.midY, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                    
                }
            
            datePickerContainer.show()
            
    //            topWindow.rootViewController?.present(datePickerContainer, animated: true, completion: {})
                
                
    //        });
            
            return datePicker;
        }
    
    
    //    MARK:- upPickerShow
    func upPickerShow(withArray array: NSArray, withkey key1: String, withTag tag: Int, completionHandler:@escaping (UIPickerView, Any)->())
    {
        
        if(array.count > 0)
        {
            pickerArray = array
            //            print("value of pickerArray",pickerArray)
            str_Pickerkey = key1
            
            let datePickerContainer = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.actionSheet)

            let margin:CGFloat = 10.0
            
            var width = datePickerContainer.view.bounds.size.width - margin * 4.0
            
            if (UIDevice.current.userInterfaceIdiom == .pad){
                width = 270
            }
            
            
            
            let rect = CGRect(x: margin, y: margin, width: width, height: 200)
            // CGRectMake(left), top, width, height) - left and top are like margins
        
            
            picker = UIPickerView (frame:rect)
//            picker.center.x = ref.center.x
            
            picker.tag = tag
            picker.delegate = self
            datePickerContainer.view.addSubview(picker)
            
            datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("Select", comment: ""), style: .default, handler: {(_ action: UIAlertAction?) -> Void in
                completionHandler(self.picker,self.pickerArray[self.picker.selectedRow(inComponent: 0)])
                
                
            }))
            
            datePickerContainer.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: nil))
            
            
            if array.count > 0
            {
                
                
                let topWindow = UIWindow(frame: UIScreen.main.bounds)

                
                if let popoverController = datePickerContainer.popoverPresentationController {

                    popoverController.sourceView = topWindow
                    popoverController.sourceRect =  CGRect(x:topWindow.bounds.midX - (rect.width/2), y: topWindow.bounds.midY - (rect.height/2), width: 0, height: 0)

                    popoverController.permittedArrowDirections = []

                }
                
                datePickerContainer.show()

                
            }
        }
    }
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerArray.count
        
    }
    
  
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {


        return 50
    }

    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let myView = UIView(frame: CGRect(x: 50, y: 0, width:120, height: 50))

        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 50))


        let dicOfValue: NSDictionary = pickerArray[row] as! NSDictionary

        for _ in 0..<pickerArray.count {

            myImageView.sd_setImage(with: URL.init(string: "\(utilityObject.kImageBaseUrl)\(dicOfValue["apm_image"] as! String)"), placeholderImage: utilityObject.kPlaceholderImage, options: .refreshCached, completed: nil)




            myView.addSubview(myImageView)

        }

        return myView

    }
    
}
class ButtonWithShadow: UIButton {

    override func draw(_ rect: CGRect) {
        updateLayerProperties()
    }

    func updateLayerProperties() {
        self.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
    }

}
