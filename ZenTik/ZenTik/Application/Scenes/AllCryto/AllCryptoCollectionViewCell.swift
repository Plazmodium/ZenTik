//
//  AllCryptoCollectionViewCell.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/10/28.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class AllCryptoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var uiViewImage: UIView!
    
    override func awakeFromNib() {
//        coinImage.layer.shadowColor = UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1).cgColor
//        coinImage.layer.shadowOffset = CGSize(width: 0, height: 1)
//        coinImage.layer.shadowOpacity = 1
//        coinImage.layer.shadowRadius = 1.0
//        coinImage.clipsToBounds = true
//        coinImage.layer.cornerRadius = 10
        uiViewImage.layer.shadowColor = UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1).cgColor
        uiViewImage.layer.shadowOffset = CGSize(width: 0, height: 1)
        uiViewImage.layer.shadowOpacity = 1
        uiViewImage.layer.shadowRadius = 1.0
        uiViewImage.clipsToBounds = true
        
    }
}
