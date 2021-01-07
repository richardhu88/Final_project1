//
//  ActivityTableViewCell.swift
//  Final_project1
//
//  Created by 胡嘉樺 on 2021/1/7.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    @IBOutlet  var nameLabel: UILabel!
    
    @IBOutlet  var subnameLabel: UILabel!
    
    
   @IBOutlet  var activityImage: UIImageView!//{
//        didSet {
//            activityImage.layer.cornerRadius = activityImage.bounds.width / 2
//            activityImage.clipsToBounds = true
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
