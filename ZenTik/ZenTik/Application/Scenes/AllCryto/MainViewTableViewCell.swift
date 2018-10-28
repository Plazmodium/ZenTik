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
    @IBOutlet weak var algorithm: UILabel!
    @IBOutlet weak var fullyPremined: UILabel!
    @IBOutlet weak var preminedValue: UILabel!
    @IBOutlet weak var totalCoinSupply: UILabel!
    @IBOutlet weak var totalCoinsFreeFloating: UILabel!
    @IBOutlet weak var cryptoSponsored: UILabel!
    @IBOutlet weak var cryptoTrading: UILabel!
    @IBOutlet weak var cryptoProofType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        theDataView.layer.cornerRadius = 10.0
        theDataView.layer.shadowColor = UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1).cgColor//UIColor.black.cgColor
        theDataView.layer.shadowOffset = CGSize(width: 0, height: 1)
        theDataView.layer.shadowOpacity = 1
        theDataView.layer.shadowRadius = 1.0
        theDataView.clipsToBounds = false
        
        cryptoImage.layer.shadowColor = UIColor.black.cgColor
        cryptoImage.layer.shadowOffset = CGSize(width: 0, height: 1)
        cryptoImage.layer.shadowOpacity = 1
        cryptoImage.layer.shadowRadius = 1.0
        cryptoImage.clipsToBounds = true
        cryptoImage.layer.cornerRadius = 10
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
