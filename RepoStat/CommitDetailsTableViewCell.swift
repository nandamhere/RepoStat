//
//  CommitDetailsTableViewCell.swift
//  RepoStat
//
//  Created by Vaibhav Nandam on 4/15/21.
//

import UIKit

class CommitDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var commitHash: UILabel!
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
