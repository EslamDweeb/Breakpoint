//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by eslam dweeb on 4/4/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabl: UILabel!
    @IBOutlet weak var contantLbl: UILabel!
    
    func configurCell(profileImage: UIImage,email: String,contant: String){
        self.profileImage.image = profileImage
        self.emailLabl.text = email
        self.contantLbl.text = contant
    }
    
    
}
