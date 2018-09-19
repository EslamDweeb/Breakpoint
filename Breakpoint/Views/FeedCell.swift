//
//  FeedCell.swift
//  Breakpoint
//
//  Created by eslam dweeb on 4/1/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contantLbl: UILabel!
    
    func configureCell(profileImage: UIImage,email: String,contant: String){
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contantLbl.text = contant
    }
}
