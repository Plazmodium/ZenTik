//
//  Cryptos.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

public class CryptoModel{

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

//    init(cryptoParserData:CryptoParser){
//        self.asset_id = cryptoParserData.assetID
//        self.name = cryptoParserData.name
//        self.isCrypto = cryptoParserData.typeIsCrypto
//        self.dateStarted = cryptoParserData.dataStart
//
//    }


}

