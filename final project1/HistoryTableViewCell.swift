//
//  HistoryTableViewCell.swift
//  final project1
//
//  Created by adam lin on 2018/1/11.
//  Copyright © 2018年 adam lin. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {


    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var coursedate: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
