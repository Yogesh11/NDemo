//
//  UserCell.swift
//  SampleProj
//
//  Created by Yogesh on 10/31/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName : UILabel!
    @IBOutlet weak var userSkill: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code'
        userImage.layer.cornerRadius = userImage.frame.size.width / 2;
        userImage.clipsToBounds = true;
        userImage.contentMode = .scaleToFill
        userImage.backgroundColor = .gray
    }

    internal func displayContent(userModel : UserModel){
        userImage.sd_setImage(with: userModel.imageUrl) { (image, error, cacheType, url) in

        }
        userName.text   = userModel.name
        userSkill.text  = userModel.skill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
