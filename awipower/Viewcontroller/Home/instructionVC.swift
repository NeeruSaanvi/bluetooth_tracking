//
//  instructionVC.swift
//  awipower
//
//  Created by Srajan on 09/02/21.
//

import UIKit

class instructionVC: UIViewController {

    
    var instructiontittle = ""
    @IBOutlet weak var lblinstrusction:UILabel!
    
    var typeofselected = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if typeofselected == "Fatburn"{
            lblinstrusction.text = "This page is Fat Burn Settings page The red button adjustable parameter Select the next button to enter the training interface."
        }else if typeofselected == "Cardio" {
            lblinstrusction.text = "This page is Cardio Settings page The red button adjustable parameter Select the next button to enter the training interface."
        } else if typeofselected == "Stregnth"{
            lblinstrusction.text = "This page is Stregnth Settings page The red button adjustable parameter Select the next button to enter the training interface."
        }else if typeofselected == "Relax"{
            lblinstrusction.text = "This page is Relax Settings page The red button adjustable parameter Select the next button to enter the training interface."
        }else if typeofselected == "Professonal"{
            lblinstrusction.text = "This page is Professonal Settings page The red button adjustable parameter Select the next button to enter the training interface."
        }else if typeofselected == "Vip"{
            lblinstrusction.text = "This page is Vip Settings page The red button adjustable parameter Select the next button to enter the training interface."
            
        }
    
    }
    
    
    @IBAction func remove_btnclicked(sender:UIButton){
        remove()
    }
    

}
