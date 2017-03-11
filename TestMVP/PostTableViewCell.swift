//
//  PostTableViewCell.swift
//  TestMVP
//
//  Created by Vinayakam D Ganesh on 04/03/17.
//  Copyright © 2017 Vinayakam D Ganesh. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak public var bodyLabel: UILabel!
    @IBOutlet weak public var userIdLabel: UILabel!
    @IBOutlet weak public var postIdLabel: UILabel!
    @IBOutlet weak public var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
