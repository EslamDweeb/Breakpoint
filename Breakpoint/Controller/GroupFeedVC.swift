//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by eslam dweeb on 4/4/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    @IBOutlet weak var memberLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var sendBtmView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    var group: Group?
    var groupMessages = [Message]()
    
    func initData(forGroup group: Group){
        self.group = group
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsFor(group: group!) { (retuendeEmailArray) in
            self.memberLbl.text = retuendeEmailArray.joined(separator: ", ")
        }
        DataService.instance.REF_GROUPS.observe(.value) { (snapShot) in
            DataService.instance.getAllMessageFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath.init(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtmView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uplodPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupkey: group?.key, sendComplete: { (completed) in
                if completed{
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            })
        }
        
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension GroupFeedVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell") as? GroupFeedCell else{ return UITableViewCell()}
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsernmae(forUID: message.senderId) { (email) in
            cell.configurCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, contant: message.contant)
        }
        return cell
    }
    
    
    
    
    
}
