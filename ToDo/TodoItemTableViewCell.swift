//
//  TodoItemTableViewCell.swift
//  ToDo
//
//  Created by bohlool mohammadi on 5/22/18.
//  Copyright © 2018 bohlool mohammadi. All rights reserved.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
