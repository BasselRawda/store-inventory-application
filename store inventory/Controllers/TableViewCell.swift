//
//  TableViewCell.swift
//  store inventory
//
//  Created by Jad Rawda on 3/12/19.
//  Copyright © 2019 Rawda. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    @IBOutlet weak var modelLBL: UILabel!
    @IBOutlet weak var cpuLBL: UILabel!
    @IBOutlet weak var manufacturerLBL: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
