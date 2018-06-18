import Foundation

//typealias CryptoParser = [CryptoParserElement]

struct CryptoParser: Codable {
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
}

