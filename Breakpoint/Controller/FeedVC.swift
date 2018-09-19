//
//  FeedVC.swift
//  Breakpoint
//
//  Created by eslam dweeb on 3/28/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    var messageArray = [Message]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessage { (returnedMessageArray) in
            self.messageArray = returnedMessageArray.reversed()
            self.tableView.reloadData()
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else{return UITableViewCell()}
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        DataService.instance.getUsernmae(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername , contant: message.contant)
        }
        return cell
    }
}
