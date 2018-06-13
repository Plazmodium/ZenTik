// To parse the JSON, add this file to your project and do:
//
//   let cryptos = try? JSONDecoder().decode(Cryptos.self, from: jsonData)

import Foundation

typealias cryptos = [CryptoParser]

class CryptoParser: Codable {

    let assetID, name: String
    let typeIsCrypto: Int
    let dataStart, dataEnd: String
    let dataQuoteStart, dataQuoteEnd, dataOrderbookStart, dataOrderbookEnd: String?
    let dataTradeStart, dataTradeEnd: String?
    let dataTradeCount: Int?
    let dataSymbolsCount: Int

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case typeIsCrypto = "type_is_crypto"
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

    init(assetID: String,
         name: String,
         typeIsCrypto: Int,
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

        self.assetID = assetID
        self.name = name
        self.typeIsCrypto = typeIsCrypto
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

//import Foundation
//
////typealias CryptoParser = [CryptoParserElement]
//
//struct CryptoParser: Codable {
//    let assetID, name: String
//    let typeIsCrypto: Int
//    let dataStart, dataEnd: String
//    let dataQuoteStart, dataQuoteEnd, dataOrderbookStart, dataOrderbookEnd: String?
//    let dataTradeStart, dataTradeEnd: String?
//    let dataTradeCount: Int?
//    let dataSymbolsCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case name
//        case typeIsCrypto = "type_is_crypto"
//        case dataStart = "data_start"
//        case dataEnd = "data_end"
//        case dataQuoteStart = "data_quote_start"
//        case dataQuoteEnd = "data_quote_end"
//        case dataOrderbookStart = "data_orderbook_start"
//        case dataOrderbookEnd = "data_orderbook_end"
//        case dataTradeStart = "data_trade_start"
//        case dataTradeEnd = "data_trade_end"
//        case dataTradeCount = "data_trade_count"
//        case dataSymbolsCount = "data_symbols_count"
//    }
//}

