//
//  ShadowView.swift
//  Breakpoint
//
//  Created by eslam dweeb on 3/28/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor        
        super.awakeFromNib()
    }

}
