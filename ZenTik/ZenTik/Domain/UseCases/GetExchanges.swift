//
//  GetExchanges.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/08.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

public protocol GetExchanges {
    func GetTheExchanges() -> [ExchangeModel]
}
