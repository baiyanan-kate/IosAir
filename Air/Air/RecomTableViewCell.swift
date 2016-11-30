//
//  RecomTableViewCell.swift
//  Air
//
//  Created by byn on 2016/11/27.
//  Copyright © 2016年 zero. All rights reserved.
//

import UIKit

class RecomTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var recomType: UILabel!
    
    
    @IBAction func showAll(_ sender: UIButton) {
    }
    
    @IBOutlet weak var showAllMessage: UIButton!
    
    @IBOutlet weak var imageTop: UIImageView!
    
    
    @IBOutlet weak var imageLeft: UIImageView!
    
    
    @IBOutlet weak var imageRight: UIImageView!
    
    
    @IBOutlet weak var brifeIntro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
