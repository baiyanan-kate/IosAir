//
//  TravelTableViewCell.swift
//  Air
//
//  Created by zero on 2016/11/28.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

class TravelTableViewCell: UITableViewCell {


    @IBOutlet weak var line: UIImageView!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var show: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
