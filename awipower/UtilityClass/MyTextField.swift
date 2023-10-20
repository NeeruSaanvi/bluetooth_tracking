//
//  MyTextField.swift
//  MOCSwift
//
//  Created by Piyush Agarwal on 11/23/16.
//  Copyright © 2016 Pinesucceed. All rights reserved.
//

import UIKit



class MyTextField: UITextField
{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        //self.layer.cornerRadius = 15.0
        
        self.layer.borderWidth = 1.0
//        self.layer.borderColor = ((UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)).cgColor)
        
        self.layer.borderColor = UIColor.gray.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2 , height:2)
        
//        self.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
}



class MyTextFieldBlueBorder: UITextField
{
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        //self.layer.cornerRadius = 15.0
        
        self.layer.borderWidth = 1.0
        //        self.layer.borderColor = ((UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)).cgColor)
        
        self.layer.borderColor = ((UIColor(red: 119/255, green: 185/255, blue: 251/255, alpha: 1)).cgColor)
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2 , height:2)
        
        //        self.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
}



class MyTextField2: UITextField
{
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        //self.layer.cornerRadius = 15.0
        
//        self.layer.borderWidth = 1.0
//        //        self.layer.borderColor = ((UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)).cgColor)
//
//        self.layer.borderColor = UIColor.gray.cgColor
//
//        self.layer.masksToBounds = false
//        self.layer.shadowRadius = 3
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 2 , height:2)
        
        //        self.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
}






class MyTextField1: UITextField
{
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 30
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 0.5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2 , height:2)

        //self.layer.cornerRadius = 15.0
//
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = ((UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)).cgColor)
        //        self.layer.borderColor = UIColor.lightGray.cgColor

    }

    
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
}



class MyTextFieldCorrect : UITextField{
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    
        self.layer.cornerRadius = 15
            self.layer.borderWidth = 0.25
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 0.5
 //       self.layer.borderWidth = 0.4
//        self.layer.clipToBound
        self.layer.borderColor = UIColor.gray.cgColor
        //
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        self.clipsToBounds = true

       
        
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    
    
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: padding)
    }
    func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
    
}



class MyTextFieldWithDarkBorder: UITextField
{
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15.0
        
        self.layer.borderWidth = 2.0
        //        self.layer.borderColor = ((UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)).cgColor)
        
        self.layer.borderColor = UIColor.gray.cgColor
//
//        self.layer.masksToBounds = false
//        self.layer.shadowRadius = 3
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 2 , height:2)
//
        //        self.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
}

class MyTextFieldWithBorder: UITextField
{
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        //self.layer.cornerRadius = 15.0
        
        self.layer.borderWidth = 1.0
        //        self.layer.borderColor = ((UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)).cgColor)
        
        self.layer.borderColor = UIColor.gray.cgColor
//
//        self.layer.masksToBounds = false
//        self.layer.shadowRadius = 3
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 2 , height:2)
//
        //        self.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect
    {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func placeHolderTextField(placeHolderText:String , placeHolderColor:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
}






class MyButton:UIButton {
    
    
        required public init?(coder aDecoder: NSCoder) {
            
            super.init(coder: aDecoder)
            
            
            self.layer.cornerRadius = 15
//             self.layer.borderWidth = 1
        
        
    }
    
}


class MyButtonwithborderGray:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        
    }
    
}


class MyButtonSearch:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 5
        //             self.layer.borderWidth = 1
        
        
    }
    
}

class MyButtonCorrect:UIButton{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 3
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)

        
        
    }
    
}

class MyButtonOnlyBorder:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
//        self.layer.cornerRadius = 5
                     self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        
        
    }

//    override var isHighlighted: Bool {
//        get {
//            return super.isHighlighted
//        }
//        set {
//            if newValue {
//                backgroundColor = UIColor.gray
//            }
//            else {
//                backgroundColor = UIColor.white
//            }
//            super.isHighlighted = newValue
//        }
//    }
    
}


class MyButtonOnlyShadow:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        

      //   self.layer.cornerRadius = 15
//         let shadowLayer = CAShapeLayer()
         
         // border
         //self.layer.borderWidth = 1.0
         //self.layer.borderColor = UIColor.black.cgColor
         
        
//          shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
         //self.layer.masksToBounds = false
         self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
//         self.layer.shadowPath = shadowLayer.path
       //  self.layer.shadowRadius = 3
        
        
//        self.layer.cornerRadius = 5
//                     self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.gray.cgColor
        
        
    }

//    override var isHighlighted: Bool {
//        get {
//            return super.isHighlighted
//        }
//        set {
//            if newValue {
//                backgroundColor = UIColor.gray
//            }
//            else {
//                backgroundColor = UIColor.white
//            }
//            super.isHighlighted = newValue
//        }
//    }
    
}

class MyButtonWithBorderCommon:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = ((UIColor(red: 119/255, green: 185/255, blue: 251/255, alpha: 1)).cgColor)
        
        
    }
    
}

class MyButtonWithBorderGreen:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = ((UIColor(red: 69/255, green: 179/255, blue: 53/255, alpha: 1)).cgColor)
        
        
    }
    
}

class MyButtonWithBorderBlue:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = ((UIColor(red: 30/255, green: 51/255, blue: 107/255, alpha: 1)).cgColor)
        
    }
    
}

class MyRadiusButton:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 2
        self.clipsToBounds = true
//        self.backgroundColor = UIColor(red: 255/255, green: 106/255, blue: 55/255, alpha: 1)
        
        
    }
    
}




class MyColorButton:UIButton {


    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)


        self.layer.cornerRadius = 10
         self.clipsToBounds = true
        self.backgroundColor = utilityObject.kCommanColor


    }

}

class MyColorButtonBlue:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
//        self.backgroundColor = UIColor(red: 39/255, green: 55/255, blue: 104/255, alpha: 1)
        self.backgroundColor = utilityObject.kCommanColor
        
        
    }
    
}



class MyColorButtonGreen:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1)
        
        
    }
    
}

class MyRoundButton:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
       // self.backgroundColor = UIColor(red: 255/255, green: 106/255, blue: 55/255, alpha: 1)

//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 20)
//        self.layer.shadowRadius = 20
//        self.layer.shadowOpacity = 1.0
        
    }
    
}

class MyRoundCornerButtonWithShadow:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = true
        
        // self.backgroundColor = UIColor(red: 255/255, green: 106/255, blue: 55/255, alpha: 1)
        
                self.layer.shadowColor = UIColor.lightGray.cgColor
                self.layer.shadowOffset = CGSize(width: 0, height: 2)
                self.layer.shadowRadius = 1.2
                self.layer.shadowOpacity = 0.6
        
    }
    
}

class MyRoundCornerButtonWithShadowAndImage:UIButton {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = true
        
        // self.backgroundColor = UIColor(red: 255/255, green: 106/255, blue: 55/255, alpha: 1)
        self.clipsToBounds = true
                self.layer.shadowColor = UIColor.lightGray.cgColor
                self.layer.shadowOffset = CGSize(width: 0, height: 2)
                self.layer.shadowRadius = 1.2
        self.layer.shadowOpacity = 0.6

        
        
    }
    
}



    class MyView:UIView {
        
        
        required public init?(coder aDecoder: NSCoder) {
            
            super.init(coder: aDecoder)
            
            
            self.layer.cornerRadius = self.frame.height/2
            self.clipsToBounds = true
//            self.layer.borderWidth = 1
            
        }
        
}



class MyViewCorner:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        //            self.layer.borderWidth = 1
        
    }
    
}


class MyViewLogIn:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        //            self.layer.borderWidth = 1
        
    }
    
}




class MyViewDash:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15.0
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        
    }
    
}

class MyViewDonate:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15.0
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.gray.cgColor
        
    }
    
}

class MyViewDonate1:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        
    }
    
}



class MyView1:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 1.0
        self.clipsToBounds = true
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}


class MyRedshadowView:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
//           buyerSellerCell.cellView.layer.borderWidth = 0.3
//                buyerSellerCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
//                buyerSellerCell.cellView.layer.shadowColor = UIColor.gray.cgColor
//                buyerSellerCell.cellView.layer.shadowOffset = CGSize(width: 0.6, height: 0.1)//CGSizeMake(0, 2.0);
//                buyerSellerCell.cellView.layer.shadowOpacity = 0.4
//                buyerSellerCell.cellView.layer.masksToBounds = false
//                buyerSellerCell.cellView.clipsToBounds = true
//
//                buyerSellerCell.cellView.layer.shadowRadius = 0.3
//
        //        buyerSellerCell.imgProfile.layer.borderWidth = 0.5
//        //        buyerSellerCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
//                buyerSellerCell.imgProfile.layer.shadowColor = UIColor.lightGray.cgColor
//                buyerSellerCell.imgProfile.layer.shadowOffset = CGSize(width: 2, height: 0.5)//CGSizeMake(0, 2.0);
//                buyerSellerCell.imgProfile.layer.shadowOpacity = 0.4
//                buyerSellerCell.imgProfile.layer.cornerRadius = 5
//                buyerSellerCell.imgProfile.layer.shadowRadius = 0.5
//                buyerSellerCell.imgProfile.layer.masksToBounds = false
//                buyerSellerCell.imgProfile.clipsToBounds = true
                
        
       // self.layer.cornerRadius = 15.0
        //self.clipsToBounds = true
        // corner radius
        self.layer.cornerRadius = 1.5
        self.layer.borderWidth = 0.3
        self.layer.borderColor = #colorLiteral(red: 1, green: 0.3181872964, blue: 0, alpha: 1)
        // border
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = UIColor.black.cgColor
        
        // shadow
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.6, height: 0.1)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 0.5
        self.clipsToBounds = true
    }
    
}





class MyshadowView:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
//           buyerSellerCell.cellView.layer.borderWidth = 0.3
//                buyerSellerCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
//                buyerSellerCell.cellView.layer.shadowColor = UIColor.gray.cgColor
//                buyerSellerCell.cellView.layer.shadowOffset = CGSize(width: 0.6, height: 0.1)//CGSizeMake(0, 2.0);
//                buyerSellerCell.cellView.layer.shadowOpacity = 0.4
//                buyerSellerCell.cellView.layer.masksToBounds = false
//                buyerSellerCell.cellView.clipsToBounds = true
//
//                buyerSellerCell.cellView.layer.shadowRadius = 0.3
//
        //        buyerSellerCell.imgProfile.layer.borderWidth = 0.5
//        //        buyerSellerCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
//                buyerSellerCell.imgProfile.layer.shadowColor = UIColor.lightGray.cgColor
//                buyerSellerCell.imgProfile.layer.shadowOffset = CGSize(width: 2, height: 0.5)//CGSizeMake(0, 2.0);
//                buyerSellerCell.imgProfile.layer.shadowOpacity = 0.4
//                buyerSellerCell.imgProfile.layer.cornerRadius = 5
//                buyerSellerCell.imgProfile.layer.shadowRadius = 0.5
//                buyerSellerCell.imgProfile.layer.masksToBounds = false
//                buyerSellerCell.imgProfile.clipsToBounds = true
                
        
       // self.layer.cornerRadius = 15.0
        //self.clipsToBounds = true
        // corner radius
        self.layer.cornerRadius = 15
        
//        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor.lightGray.cgColor
//        // border
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = UIColor.black.cgColor
        
        // shadow
        self.layer.shadowColor = #colorLiteral(red: 0.5176470588, green: 0.5294117647, blue: 0.6941176471, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 25, height: 25)
        self.layer.shadowOpacity = 125.0
        self.layer.shadowRadius = 125.0
        self.clipsToBounds = true
    }
    
}
class MyRoundView:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        //           buyerSellerCell.cellView.layer.borderWidth = 0.3
        //                buyerSellerCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
        //                buyerSellerCell.cellView.layer.shadowColor = UIColor.gray.cgColor
        //                buyerSellerCell.cellView.layer.shadowOffset = CGSize(width: 0.6, height: 0.1)//CGSizeMake(0, 2.0);
        //                buyerSellerCell.cellView.layer.shadowOpacity = 0.4
        //                buyerSellerCell.cellView.layer.masksToBounds = false
        //                buyerSellerCell.cellView.clipsToBounds = true
        //
        //                buyerSellerCell.cellView.layer.shadowRadius = 0.3
        //
        //        buyerSellerCell.imgProfile.layer.borderWidth = 0.5
        //        //        buyerSellerCell.cellView.layer.borderColor = UIColor.lightGray.cgColor
        //                buyerSellerCell.imgProfile.layer.shadowColor = UIColor.lightGray.cgColor
        //                buyerSellerCell.imgProfile.layer.shadowOffset = CGSize(width: 2, height: 0.5)//CGSizeMake(0, 2.0);
        //                buyerSellerCell.imgProfile.layer.shadowOpacity = 0.4
        //                buyerSellerCell.imgProfile.layer.cornerRadius = 5
        //                buyerSellerCell.imgProfile.layer.shadowRadius = 0.5
        //                buyerSellerCell.imgProfile.layer.masksToBounds = false
        //                buyerSellerCell.imgProfile.clipsToBounds = true
        
        
        // self.layer.cornerRadius = 15.0
        //self.clipsToBounds = true
        // corner radius
        self.layer.cornerRadius = self.frame.height/2
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        // border
    }
}
class MyFullshadowView:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        
        //self.clipsToBounds = true
        // corner radius
        self.layer.cornerRadius = 0
        let shadowLayer = CAShapeLayer()
        
        // border
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = UIColor.black.cgColor
        
       
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius:0).cgPath
        //self.layer.masksToBounds = false
        self.layer.shadowColor = #colorLiteral(red: 0.5176470588, green: 0.5294117647, blue: 0.6941176471, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 2.0, height:2.5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = shadowLayer.path
        self.layer.shadowRadius = 1
       
        
        
    }
    
}
class MyFullshadowViewleft_side:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        
        //self.clipsToBounds = true
        // corner radius
        self.layer.cornerRadius = 0
        let shadowLayer = CAShapeLayer()
        
        // border
        //self.layer.borderWidth = 1.0
        //self.layer.borderColor = UIColor.black.cgColor
        
       
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius:0).cgPath
        //self.layer.masksToBounds = false
        self.layer.shadowColor = #colorLiteral(red: 0.5176470588, green: 0.5294117647, blue: 0.6941176471, alpha: 1)
        self.layer.shadowOffset = CGSize(width:-2.0, height:2.5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = shadowLayer.path
        self.layer.shadowRadius = 1
       
        
        
    }
    
}


class MyFullshadowViewPro:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2 , height:2)
        
        
        
    }
    
}

class myViewShadowAndRound:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1 , height:1)
        
    }
    
}


class myViewShadowAndRoundLessOpacity:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1 , height:1)
        
    }
    
}

class MyFullshadow:UICollectionView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2 , height:2)
        
        
    }
    
}



class MyFullshadowViewInvoice:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2 , height:2)
        
        
    }
    
}

class MyFullshadowViewCrypto:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 7
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 4 , height:2)
        
        
        
    }
    
}


class MyshadowViewForTextView:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 7
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 4 , height:2)
        
        
        
    }
    
}


        class MyTextView:UITextView{
            
            
            required public init?(coder aDecoder: NSCoder) {
                
                super.init(coder: aDecoder)
                
                
                //self.layer.cornerRadius = 15.0
                self.clipsToBounds = true
                self.layer.borderWidth = 0.5
                self.layer.shadowRadius = 0.6
                self.layer.shadowOffset = CGSize(width: 2, height: 0)
                self.layer.shadowColor = UIColor.gray.cgColor
                
                self.layer.borderColor = UIColor.lightGray.cgColor
                
                self.layer.cornerRadius = 15
            }
         
        }


class MyTextViewPadd:UITextView{


    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)



        self.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 50)


    }

}
class MyTextViewShadow:UITextView{
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        

        
        
        self.layer.cornerRadius = 15.0
  
                self.layer.masksToBounds = false
                self.layer.shadowRadius = 5
                self.layer.shadowOpacity = 0.5
                self.layer.shadowColor = UIColor.gray.cgColor
                self.layer.shadowOffset = CGSize(width: 2 , height:2)
        
        
      
        
        
    }
    
}

class MyTextViewCorner:UITextView{
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 10.0
                self.clipsToBounds = true
    }
    
}




class MySegment:UISegmentedControl {
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
      // self.layer.borderColor = UIColor.orange.cgColor
//        self.layer.borderColor = UIColor.clear.cgColor
        
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = true
        
        
        
//        self.layer.shadowRadius = 4
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0 , height:5)
        
    }
    
}

class MyImageView:UIImageView{
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 100/2
        self.clipsToBounds = true
         self.layer.borderWidth = 5
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.937254902, blue: 1, alpha: 1)
        
    }
    
}

class MyImageViewProfile:UIImageView{
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 135/2
        self.clipsToBounds = true
         self.layer.borderWidth = 10
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.937254902, blue: 1, alpha: 1)
        
    }
    
}




class MyRoundImageView:UIImageView{
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        

    let radius = self.frame.height/2.0
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
    
    
    self.layer.borderWidth = 1
    
//    self.layer.borderColor = ((UIColor(red: 146/255, green: 237/255, blue: 241/255, alpha: 1)).cgColor)
     self.layer.borderColor = UIColor.lightGray.cgColor
        
    
    self.clipsToBounds = true
    
    
    }

}

class Mylabel:UILabel {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.cornerRadius = 15.0
        self.clipsToBounds = true
        
        
    }
    
}


class MylabelBorder:UILabel {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        self.layer.borderWidth = 1
        self.layer.borderColor = (UIColor(red: 119/255, green: 185/255, blue: 251/255, alpha: 1).cgColor)
        
        
    }
    
}


class MyLabelPadded: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left:10, bottom: 0, right: 10)
        super.drawText(in: rect.inset(by: insets))
    }
    
}


class viewWithBackground:UIView {
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
         self.backgroundColor = UIColor(patternImage: UIImage(named: "transbg")!)
        
        
    }
    
}


class circleView:UIView{
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    
    self.layer.cornerRadius = self.frame.size.width/2
    self.clipsToBounds = true
    self.layer.borderColor = (UIColor(red: 119/255, green: 185/255, blue: 251/255, alpha: 1)).cgColor
    self.layer.borderWidth = 3.0
        
    }
}

class PentagonView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        let h = size.height * 0.85      // adjust the multiplier to taste

        // calculate the 5 points of the pentagon
        let p1 = self.bounds.origin
        let p2 = CGPoint(x:p1.x + size.width, y:p1.y)
        let p3 = CGPoint(x:p2.x, y:p2.y + h)
        let p4 = CGPoint(x:size.width/2, y:size.height)
        let p5 = CGPoint(x:p1.x, y:h)

        // create the path
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addLine(to: p5)
        path.close()

        // fill the path
        UIColor.clear.set()
        path.fill()
        
        // Stroke
               UIColor.lightGray.setStroke()
               path.lineWidth = 2
               path.stroke()
    }
}





/*
 color code
 
 for red
 
 ((UIColor(red: 252/255, green: 107/255, blue: 104/255, alpha: 1)).cgColor)
FC6B68
 
 
 
 for green
 
 ((UIColor(red: 49/255, green: 179/255, blue: 89/255, alpha: 1)).cgColor)
 31B359
 
 
 27,48,100
 1B3064
 
 */
@IBDesignable class RoundRectView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 50
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    private var customBackgroundColor = UIColor.white
    override var backgroundColor: UIColor?{
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
        }
    }

    func setup() {
//        layer.shadowColor = UIColor.black.cgColor
//        //layer.shadowOffset = CGSizeZero;
//        layer.shadowRadius = 5.0;
//        layer.shadowOpacity = 0.5;
//        super.backgroundColor = UIColor.clear
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    override func draw(_ rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ).fill()

      let borderRect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
      let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
       borderColor.setStroke()
       borderPath.lineWidth = borderWidth
       borderPath.stroke()

        // whatever else you need drawn
    }
}
@IBDesignable class RoundView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 6
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 1, green: 0.3774099946, blue: 0.3467015624, alpha: 1)
    @IBInspectable var borderWidth: CGFloat = 0.1
    private var customBackgroundColor = UIColor.white
    override var backgroundColor: UIColor?{
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
        }
    }

    func setup() {
//        layer.shadowColor = UIColor.black.cgColor
//        //layer.shadowOffset = CGSizeZero;
//        layer.shadowRadius = 5.0;
//        layer.shadowOpacity = 0.5;
//        super.backgroundColor = UIColor.clear
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    override func draw(_ rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ).fill()

      let borderRect = bounds.insetBy(dx: borderWidth, dy: borderWidth)
      let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth)
       borderColor.setStroke()
       borderPath.lineWidth = borderWidth
       borderPath.stroke()

        // whatever else you need drawn
    }
}
@IBDesignable
class RoundUIView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable  var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
@IBDesignable class homeviewrouded: UIView {

    @IBInspectable var cornerRadius: CGFloat = 20
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0
    private var customBackgroundColor = UIColor.white
    override var backgroundColor: UIColor?{
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
        }
    }

    func setup() {
//        layer.shadowColor = UIColor.black.cgColor
//        //layer.shadowOffset = CGSizeZero;
//        layer.shadowRadius = 5.0;
//        layer.shadowOpacity = 0.5;
//        super.backgroundColor = UIColor.clear
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    override func draw(_ rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ).fill()

      let borderRect = bounds.insetBy(dx: borderWidth, dy: borderWidth)
      let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth)
       borderColor.setStroke()
       borderPath.lineWidth = borderWidth
       borderPath.stroke()

        // whatever else you need drawn
    }
}
@IBDesignable
class RoundedCornerView: UIView {

    var cornerRadiusValue : CGFloat = 0
    var corners : UIRectCorner = []

    
    @IBInspectable public var cornerRadius : CGFloat {
        get {
            return cornerRadiusValue
        }
        set {
            cornerRadiusValue = newValue
        }
    }

    @IBInspectable public var topLeft : Bool {
        get {
            return corners.contains(.topLeft)
        }
        set {
            setCorner(newValue: newValue, for: .topLeft)
        }
    }

    @IBInspectable public var topRight : Bool {
        get {
            return corners.contains(.topRight)
        }
        set {
            setCorner(newValue: newValue, for: .topRight)
        }
    }

    @IBInspectable public var bottomLeft : Bool {
        get {
            return corners.contains(.bottomLeft)
        }
        set {
            setCorner(newValue: newValue, for: .bottomLeft)
        }
    }

    @IBInspectable public var bottomRight : Bool {
        get {
            return corners.contains(.bottomRight)
        }
        set {
            setCorner(newValue: newValue, for: .bottomRight)
        }
    }

    func setCorner(newValue: Bool, for corner: UIRectCorner) {
        if newValue {
            addRectCorner(corner: corner)
        } else {
            removeRectCorner(corner: corner)
        }
    }

    func addRectCorner(corner: UIRectCorner) {
        corners.insert(corner)
        updateCorners()
    }

    func removeRectCorner(corner: UIRectCorner) {
        if corners.contains(corner) {
            corners.remove(corner)
            updateCorners()
        }
    }

    func updateCorners() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

}
@IBDesignable
public class Gradient: UIView {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }
    

}
@IBDesignable class GradientView: UIView {

    @IBInspectable var startColor: UIColor = #colorLiteral(red: 0.9607843137, green: 0.1137254902, blue: 0, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var endColor: UIColor = #colorLiteral(red: 1, green: 0.4156862745, blue: 0.337254902, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowColor: UIColor = .lightGray {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowY: CGFloat = 3 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var shadowBlur: CGFloat = 2 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var startPointX: CGFloat = -5 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var startPointY: CGFloat = -5 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var endPointX: CGFloat = 5 {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var endPointY: CGFloat = 5{
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 8 {
        didSet {
            setNeedsLayout()
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        layer.shadowRadius = shadowBlur
        layer.shadowOpacity = 0.8
    }
}
@IBDesignable class TabBarWithCorners: UITabBar {
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 15.0

    private var shapeLayer: CALayer?

    override func draw(_ rect: CGRect) {
        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        shapeLayer.shadowOffset = CGSize(width: 0   , height: -3);
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        

        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0.0))

        return path.cgPath
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame            = self.frame
        tabFrame.size.height    = 65 + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero)
        tabFrame.origin.y       = self.frame.origin.y +   ( self.frame.height - 65 - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero))
        self.layer.cornerRadius = 20
        self.frame            = tabFrame



        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })


    }

}
@IBDesignable class shadwview: UIView {

@IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
private var customBackgroundColor = UIColor.white
override var backgroundColor: UIColor?{
    didSet {
        customBackgroundColor = backgroundColor!
        super.backgroundColor = UIColor.white
    }
}

func setup() {
    layer.shadowColor = #colorLiteral(red: 0.5176470588, green: 0.5294117647, blue: 0.6941176471, alpha: 1)
    layer.shadowOffset = CGSize.zero
    layer.shadowRadius = 2;
    layer.shadowOpacity = 3;
    super.backgroundColor = UIColor.white
}

override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
}

override func draw(_ rect: CGRect) {
    customBackgroundColor.setStroke()
    UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ?? 0).fill()

    let borderRect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
    let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
    borderColor.setStroke()
    borderPath.lineWidth = borderWidth
    borderPath.stroke()

    // whatever else you need drawn
}
}
