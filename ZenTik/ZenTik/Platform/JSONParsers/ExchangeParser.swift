//
//  ExchangeParser.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/08.
//  Copyright © 2018 Wodwo. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let exchanges = try? JSONDecoder().decode(Exchanges.self, from: jsonData)

import Foundation

//typealias Exchanges = [Exchange]

class Exchange: Codable {
    let exchangeID, website, name, dataStart: String
    let dataEnd: String
    let dataQuoteStart, dataQuoteEnd, dataOrderbookStart, dataOrderbookEnd: String?
    let dataTradeStart, dataTradeEnd: String?
    let dataTradeCount: Int?
    let dataSymbolsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case exchangeID = "exchange_id"
        case website, name
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataTradeCount = "data_trade_count"
        case dataSymbolsCount = "data_symbols_count"
    }
    
    init(exchangeID: String,
         website: String,
         name: String,
         dataStart: String,
         dataEnd: String,
         dataQuoteStart: String?,
         dataQuoteEnd: String?,
         dataOrderbookStart: String?,
         dataOrderbookEnd: String?,
         dataTradeStart: String?,
         dataTradeEnd: String?,
         dataTradeCount: Int?,
         dataSymbolsCount: Int) {
        
        self.exchangeID = exchangeID
        self.website = website
        self.name = name
        self.dataStart = dataStart
        self.dataEnd = dataEnd
        self.dataQuoteStart = dataQuoteStart
        self.dataQuoteEnd = dataQuoteEnd
        self.dataOrderbookStart = dataOrderbookStart
        self.dataOrderbookEnd = dataOrderbookEnd
        self.dataTradeStart = dataTradeStart
        self.dataTradeEnd = dataTradeEnd
        self.dataTradeCount = dataTradeCount
        self.dataSymbolsCount = dataSymbolsCount
    }
}


