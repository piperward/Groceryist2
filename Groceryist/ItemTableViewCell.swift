//
//  NoteTableViewCell.swift
//  Groceryist
//
//  Created by Piper Ward on 3/2/18.
//  Copyright © 2018 Piper Ward. All rights reserved.
//

import Foundation

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

