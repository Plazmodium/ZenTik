// To parse the JSON, add this file to your project and do:
//
//   let priceMultiParser = try? newJSONDecoder().decode(PriceMultiParser.self, from: jsonData)

import Foundation

struct PriceMultiParser: Codable {
    let raw: Raw
    let display: Display
    
    enum CodingKeys: String, CodingKey {
        case raw = "RAW"
        case display = "DISPLAY"
    }
}

struct Display: Codable {
    let btc: DisplayBtc
    
    enum CodingKeys: String, CodingKey {
        case btc = "BTC"
    }
}

struct DisplayBtc: Codable {
    let usd: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct Raw: Codable {
    let btc: RawBtc
    
    enum CodingKeys: String, CodingKey {
        case btc = "BTC"
    }
}

struct RawBtc: Codable {
    let usd: Usd
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct Usd: Codable {
    let type, market, fromsymbol, tosymbol: String
    let flags: String
    let price: Double
    let lastupdate: Int
    let lastvolume, lastvolumeto: Double
    let lasttradeid: String
    let volumeday, volumedayto, volume24Hour, volume24Hourto: Double
    let openday, highday, lowday, open24Hour: Double
    let high24Hour, low24Hour: Double
    let lastmarket: String
    let change24Hour, changepct24Hour, changeday, changepctday: Double
    let supply: Int
    let mktcap, totalvolume24H, totalvolume24Hto: Double
    
    enum CodingKeys: String, CodingKey {
        case type = "TYPE"
        case market = "MARKET"
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case flags = "FLAGS"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case lasttradeid = "LASTTRADEID"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case openday = "OPENDAY"
        case highday = "HIGHDAY"
        case lowday = "LOWDAY"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
        case lastmarket = "LASTMARKET"
        case change24Hour = "CHANGE24HOUR"
        case changepct24Hour = "CHANGEPCT24HOUR"
        case changeday = "CHANGEDAY"
        case changepctday = "CHANGEPCTDAY"
        case supply = "SUPPLY"
        case mktcap = "MKTCAP"
        case totalvolume24H = "TOTALVOLUME24H"
        case totalvolume24Hto = "TOTALVOLUME24HTO"
    }
}
