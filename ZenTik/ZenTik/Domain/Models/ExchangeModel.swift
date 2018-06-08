//
//  Exchanges.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

public struct ExchangeModel{
    
    var exchange_id:String!
    var website:String!
    var name:String!
    
    public init(exchange_id:String,
                website:String,
                name:String) {
        
        self.exchange_id = exchange_id
        self.website = website
        self.name = name
    }
}
