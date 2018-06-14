//
//  GetCurrencies.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

public protocol GetCurrencies {
    func GetTheCryptoCurrencies(apiKey:String) -> [CryptoModel]
}
