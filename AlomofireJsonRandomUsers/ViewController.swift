//
//  ViewController.swift
//  AlomofireJsonRandomUsers
//
//  Created by CodeWell on 12/3/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var userList: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://randomuser.me/api/?results=10"){
            let request = Alamofire.request(url)
            request.responseJSON { (dataReturned) in
                if let results = dataReturned.result.value as? [String:Any],
                    let jsonUsers = results["results"] {
                    if let array = jsonUsers as? [[String:Any]]{
                        for userData in array{
                            print(userData)
                            let user = User(withData: userData)
                            self.userList.append(user)
                        }
                        self.tableView.reloadData()
                    }
                    
                }
                
                
                // Do any additional setup after loading the view, typically from a nib.
            }
        }
    }
    
    
    //MARK: -Table view delegate and source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userList.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell
        if let cell = cell{
            let user = self.userList[indexPath.row]
            cell.updateCell(user: user)
            
        }
        return cell ?? UserTableViewCell ()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


