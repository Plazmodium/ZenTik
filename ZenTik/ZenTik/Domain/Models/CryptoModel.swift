//
//  Cryptos.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

public class CryptoModel:NSObject{

    let asset_id: String
    let name: String
    let isCrypto: Int
    let dateStarted: String?

    init(assest_id:String,
         name:String,
         isCrypto:Int,
         dateStarted:String) {

        self.asset_id = assest_id
        self.name = name
        self.isCrypto = isCrypto
        self.dateStarted = dateStarted
    }
}

public class CryptoModelCryptoCompare{
    
    let id : String
    let url: String
    let imageURL: String?
    let name: String
    let symbol : String
    let coinName : String
    let fullName : String
    let algorithm : String
    let proofType : String
    let fullyPremined : String
    let totalCoinSupply : String
    let preMinedValue : String
    let totalCoinsFreeFloat : String
    let sortOrder : String
    let sponsored : Bool
    let isTrading : Bool
    
    init(id : String,
         url: String,
         imageURL: String?,
         name: String,
         symbol : String,
         coinName : String,
         fullName : String,
         algorithm : String,
         proofType : String,
         fullyPremined : String,
         totalCoinSupply : String,
         preMinedValue : String,
         totalCoinsFreeFloat : String,
         sortOrder : String,
         sponsored : Bool,
         isTrading : Bool) {
        
        self.id = id
        self.url = url
        self.imageURL = imageURL
        self.name = name
        self.symbol = symbol
        self.coinName = coinName
        self.fullName = fullName
        self.algorithm = algorithm
        self.proofType = proofType
        self.fullyPremined = fullyPremined
        self.totalCoinSupply = totalCoinSupply
        self.preMinedValue = preMinedValue
        self.totalCoinsFreeFloat = totalCoinsFreeFloat
        self.sortOrder = sortOrder
        self.sponsored = sponsored
        self.isTrading = isTrading
    }
}



