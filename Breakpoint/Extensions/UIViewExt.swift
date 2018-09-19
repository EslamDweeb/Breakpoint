//
//  UIViewExt.swift
//  Breakpoint
//
//  Created by eslam dweeb on 4/1/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notifcation: NSNotification){
        
        let duration = notifcation.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notifcation.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notifcation.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notifcation.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endFrame.origin.y - beginningFrame.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
