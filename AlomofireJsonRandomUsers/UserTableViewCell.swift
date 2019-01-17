//
//  UserTableViewCell.swift
//  AlomofireJsonRandomUsers
//
//  Created by CodeWell on 12/3/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(user:User){
        self.nameLabel.text = user.firstName ?? ""
        self.lastLabel.text = user.lastName ?? ""
        self.emailLabel.text = user.email ?? ""
        self.ageLabel.text = "\(user.age ?? 0)"
        
        
    }
}
