//
//  GetPriceMulti.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/07/01.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

protocol GetTheMultiPrice{
    associatedtype T
    func GetTheMultiplePrices(exchange:String, currency:String, cryptoCoin:String, completionHandler: @escaping (T) -> Void)
}
