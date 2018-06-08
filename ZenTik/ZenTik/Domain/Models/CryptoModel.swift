//
//  Cryptos.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

public struct CryptoModel{
    
    let asset_id: String!
    let name: String!
    let isCrypto: Int!
    
    public init(assest_id:String,
                name:String,
                isCrypto:Int) {
        
        self.asset_id = assest_id
        self.name = name
        self.isCrypto = isCrypto
    }
}
