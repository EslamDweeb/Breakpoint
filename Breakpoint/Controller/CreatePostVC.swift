//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by eslam dweeb on 3/31/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendBtn.bindToKeyboard()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email

    }

    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "post somthing....."{
            sendBtn.isEnabled = false
            DataService.instance.uplodPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupkey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.sendBtn.isEnabled = false
                    print("there is an error!")
                }
            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreatePostVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}





