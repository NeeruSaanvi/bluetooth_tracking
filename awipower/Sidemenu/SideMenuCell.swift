//
//  sideMenuCell.swift
//  DDM IOS
//
//  Created by PineSucceed MacMini1 on 05/02/20.
//  Copyright © 2020 PineSucceed MacMini1. All rights reserved.
//

import UIKit



class SideMenuCell: UITableViewCell {
    @IBOutlet weak var useriamge_show: UIImageView!
    @IBOutlet weak var useremaillbl: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var user_type: UILabel!
    
    @IBOutlet weak var labName : UILabel!
    @IBOutlet weak var user_details_view:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
