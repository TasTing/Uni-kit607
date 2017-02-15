//
//  editviewTableViewCell.swift
//  Newprototype
//
//  Created by kit305 on 14/05/2016.
//  Copyright © 2016 kit305. All rights reserved.
//

import UIKit

class editviewTableViewCell: UITableViewCell {

    @IBOutlet var pic: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var serve: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var detail: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
