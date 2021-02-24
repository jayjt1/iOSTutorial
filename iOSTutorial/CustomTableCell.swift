//
//  CustomTableCell.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 24/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var imgNoti: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
