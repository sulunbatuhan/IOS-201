//
//  TableViewCell.swift
//  NoteProject
//
//  Created by batuhan on 6.09.2022.
//

import UIKit

class BaslikCell: UITableViewCell {

    @IBOutlet weak var baslik: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
