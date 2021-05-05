//
//  GroupFeedViewController.swift
//  BreakPoint
//
//  Created by Joshua Ramos on 10/1/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var contentInputView: UIView!
    @IBOutlet weak var contextTextField: InsetTextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var group: Group?
    var groupMessages = [Message]()
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentInputView.bindToKeyboard()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLabel.text = group?.groupTitle
        DataService.instance.getEmails(forGroup: group!) { (returnedEmails) in
            self.membersLabel.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessages(forGroup: self.group!, handler: { (returnedMessages) in
                self.groupMessages = returnedMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 1 {
                    let indexPath1 = IndexPath(row: self.groupMessages.count - 2, section: 0)
                    let indexPath2 = IndexPath(row: self.groupMessages.count - 1, section: 0)
                    
                    
                    self.tableView.scrollToRow(at: indexPath1, at: .bottom, animated: false)
                    self.tableView.scrollToRow(at: indexPath2, at: .bottom, animated: true)
                }
            })
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismissDetail()
    }
    @IBAction func sendButtonPressed(_ sender: Any) {
        if contextTextField.text != "" {
            contextTextField.isEnabled = false
            sendButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: contextTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key, sendComplete: { (complete) in
                if complete {
                    self.contextTextField.isEnabled = true
                    self.sendButton.isEnabled = true
                    self.contextTextField.text = ""
                }
            })
        }
    }
    
    

}

extension GroupFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedCell", for: indexPath) as? GroupFeedTableViewCell else { return UITableViewCell() }
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        return cell
    }
}
