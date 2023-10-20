//
//  Extension.swift
//  TMA
//
//  Created by PineSucceed MacMini1 on 19/04/18.
//  Copyright © 2018 PineSucceed MacMini1. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration





extension UITextField
{
    class func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor,textField:UITextField)
    {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
    
    
    // Add Done/Cancel button on number pad
    
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
           let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
           let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

           let toolbar: UIToolbar = UIToolbar()
           toolbar.barStyle = .default
           toolbar.items = [
               UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
               UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
               UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
           ]
           toolbar.sizeToFit()

           self.inputAccessoryView = toolbar
       }

       // Default actions:
    
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
    
    
    
    
    
}



extension UIViewController
{
   static let shareVC = UIViewController()
    
   func func_ShowActivityIndicatorView() -> UIActivityIndicatorView
    {
        
UIApplication.shared.keyWindow?.rootViewController?.view.isUserInteractionEnabled = false

        var activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView  = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        
        //        activityIndicatorView.color = UIColor .green
        activityIndicatorView.startAnimating()
        //        activityIndicatorView.backgroundColor = UIColor .lightGray
        activityIndicatorView.backgroundColor = UIColor .lightGray
        //.init(red: 0.0/255.0, green: 107.0/255.0, blue: 154.0/255.0, alpha: 1.0)
        activityIndicatorView.layer.cornerRadius = 5
        activityIndicatorView.clipsToBounds = true
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(activityIndicatorView)
        
        let  lbl_Loading = UILabel (frame: CGRect(x: 0, y: 70, width: 100, height: 30))
        lbl_Loading.text = "Loading..."
        lbl_Loading.textColor = UIColor .white
        lbl_Loading.textAlignment = .center
        lbl_Loading.backgroundColor = UIColor .clear
        lbl_Loading.font = UIFont (name: "Dosis-SemiBold", size: 18)
        activityIndicatorView.addSubview(lbl_Loading)
        
        return activityIndicatorView
    }
    
     func func_HideActivityIndicatorView(activityIndicatorView:UIActivityIndicatorView)
    {
        DispatchQueue.main.async
        {
            UIApplication.shared.keyWindow?.rootViewController?.view.isUserInteractionEnabled = true
            activityIndicatorView.removeFromSuperview()
        }
    }
    
    
    
    
    func seperateNumber(number:String) -> String {
        
        let largeNumber = Double(number) ?? 0.0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSize = 3
        //numberFormatter.secondaryGroupingSize = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
        return formattedNumber!
    }
    
    
    
    
}

extension UIImage{
    
    func crop(to:CGSize) -> UIImage {

      guard let cgimage = self.cgImage else { return self }

      let contextImage: UIImage = UIImage(cgImage: cgimage)

      guard let newCgImage = contextImage.cgImage else { return self }

      let contextSize: CGSize = contextImage.size

      //Set to square
      var posX: CGFloat = 0.0
      var posY: CGFloat = 0.0
      let cropAspect: CGFloat = to.width / to.height

      var cropWidth: CGFloat = to.width
      var cropHeight: CGFloat = to.height

      if to.width > to.height { //Landscape
          cropWidth = contextSize.width
          cropHeight = contextSize.width / cropAspect
          posY = (contextSize.height - cropHeight) / 2
      } else if to.width < to.height { //Portrait
          cropHeight = contextSize.height
          cropWidth = contextSize.height * cropAspect
          posX = (contextSize.width - cropWidth) / 2
      } else { //Square
          if contextSize.width >= contextSize.height { //Square on landscape (or square)
              cropHeight = contextSize.height
              cropWidth = contextSize.height * cropAspect
              posX = (contextSize.width - cropWidth) / 2
          }else{ //Square on portrait
              cropWidth = contextSize.width
              cropHeight = contextSize.width / cropAspect
              posY = (contextSize.height - cropHeight) / 2
          }
      }

      let rect: CGRect = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)

      // Create bitmap image from context using the rect
      guard let imageRef: CGImage = newCgImage.cropping(to: rect) else { return self}

      // Create a new image based on the imageRef and rotate back to the original orientation
      let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

      UIGraphicsBeginImageContextWithOptions(to, false, self.scale)
      cropped.draw(in: CGRect(x: 0, y: 0, width: to.width, height: to.height))
      let resized = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      return resized ?? self
    }
    
    func cropToBounds(width: Double, height: Double) -> UIImage {

        let cgimage = self.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)

        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }

        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!

        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

        return image
    }
    
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resizedTo1MB() -> UIImage? {
        guard let imageData = self.pngData() else { return nil }
        
        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / 1000.0 // ! Or devide for 1024 if you need KB but not kB
        
        while imageSizeKB > 1000 { // ! Or use 1024 if you need KB but not kB
            guard let resizedImage = resizingImage.resized(withPercentage: 0.9),
                let imageData = resizedImage.pngData()
                else { return nil }
            
            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / 1000.0 // ! Or devide for 1024 if you need KB but not kB
        }
        
        return resizingImage
    }
}

extension UIImageView {
    
    func makeRounded() {
        let radius = self.frame.height/2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        
        self.layer.borderWidth = 2
        
        self.layer.borderColor = ((UIColor(red: 146/255, green: 237/255, blue: 241/255, alpha: 1)).cgColor)
        
        self.clipsToBounds = true
        
        
    }
    
    func makeRoundedPro() {
        let radius = self.frame.height/2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        
        self.layer.borderWidth = 3
        
        self.layer.borderColor = UIColor.white.cgColor
        
        self.clipsToBounds = true
        
        
    }
    
    func makeRoundedGrayBordr() {
        
        let radius = self.frame.height/2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        
        self.layer.borderWidth = 3
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        self.clipsToBounds = true
        
        
    }
}

extension UITextField {
    
    
    /// set icon of 20x20 with left padding of 8px
    func setLeftIcon(_ icon: UIImage) {
        
        let padding = 8
        let size = 20
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }
    
    func setRightIcon(_ icon: UIImage) {
        
        
        let arrow = UIImageView(image: icon)
        if let size = arrow.image?.size {
            arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width + 10.0, height: size.height)
        }
        arrow.contentMode = UIView.ContentMode.center
        self.rightView = arrow
        self.rightViewMode = UITextField.ViewMode.always
        
        
        
    }
}

extension UIAlertController {
    
    func isValidEmail(_ email: String) -> Bool {
        return email.count > 0 && NSPredicate(format: "self matches %@", "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,64}").evaluate(with: email)
    }
    
    func validateTextFiled(_ str_textfiled: String) -> Bool {
        
        let str = str_textfiled.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if str.count == 0 
        {
            return false
        }
        
        return true
        
    }
    
    @objc func textDidChangeInLoginAlert() {
        if let email = textFields?[0].text,
            let action = actions.last {
            action.isEnabled = isValidEmail(email)
        }
    }
    
    
    @objc func textDidChangeInLoginAlert2() {
        if let inputtext = textFields?[0].text,
            let action = actions.last {
            action.isEnabled = validateTextFiled(inputtext)
        }
    }
    
    
   
   
    
        
        
}





extension Int {
    
    var seconds: Int {
        return self
    }
    
    var minutes: Int {
        return self.seconds * 60
    }
    
    var hours: Int {
        return self.minutes * 60
    }
    
    var days: Int {
        return self.hours * 24
    }
    
    
}

extension String
{
    public var withoutHtml: String {
           
           var a = self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
           a = a.replacingOccurrences(of: "&nbsp;", with: " ")
           let b = a.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
           
           return b;
       }
    
    public var decodeStringLatFourDigit: String {
    
    
    let data = self.data(using: .utf8)!
    do {
        if let jsondic = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any>
        {
           return(jsondic["lastFourDigits"] as? String ?? "") // use the json here
        } else {
            print("bad json")
        }
    } catch let error as NSError {
        print(error)
    }
    
    return ""
}
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.borderWidth = 1
        mask.borderColor = UIColor.white.cgColor
        layer.mask = mask
    }
}
extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}


extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

extension UIWindowScene {
    static var focused: UIWindowScene? {
        return UIApplication.shared.connectedScenes
            .first { $0.activationState == .foregroundActive && $0 is UIWindowScene } as? UIWindowScene
    }
}

//extension UIView {
//
//    @IBInspectable var shadow: Bool {
//        get {
//            return layer.shadowOpacity > 0.0
//        }
//        set {
//            if newValue == true {
//                self.addShadow()
//            }
//        }
//    }
//
////    @IBInspectable var cornerRadius: CGFloat {
////        get {
////            return self.layer.cornerRadius
////        }
////        set {
////            self.layer.cornerRadius = newValue
////
////            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
////            if shadow == false {
////                self.layer.masksToBounds = true
////            }
////        }
////    }
//
//
//    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
//               shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
//               shadowOpacity: Float = 0.4,
//               shadowRadius: CGFloat = 3.0) {
//        layer.shadowColor = shadowColor
//        layer.shadowOffset = shadowOffset
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowRadius = shadowRadius
//    }
//}
