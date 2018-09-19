//
//  Groupcell.swift
//  Breakpoint
//
//  Created by eslam dweeb on 4/3/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var groupCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int){
        self.groupTitleLbl.text = title
        self.groupDescLbl.text = description
        self.groupCountLbl.text = "\(memberCount) members."
    }
}
