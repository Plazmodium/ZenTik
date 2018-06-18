//
//  MainViewTableViewCell.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/18.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class MainViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var theDataView: UIView!
    @IBOutlet weak var cryptoImage: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoAbbreviation: UILabel!
    @IBOutlet weak var cryptoInceptionDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        theDataView.layer.cornerRadius = 10.0
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
