//
//  PriceMultiModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/07/01.
//  Copyright © 2018 Wodwo. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let priceMulti = try? JSONDecoder().decode(PriceMulti.self, from: jsonData)

import Foundation

// To parse the JSON, add this file to your project and do:
//
//   let priceMulti = try? JSONDecoder().decode(PriceMulti.self, from: jsonData)

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
    let usd, eur, gbp: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
    }
}

struct Raw: Codable {
    let btc: RawBtc
    
    enum CodingKeys: String, CodingKey {
        case btc = "BTC"
    }
}

struct RawBtc: Codable {
    let usd, eur, gbp: Currency
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
    }
}

struct Currency: Codable {
    let type, market, fromsymbol, tosymbol: String
    let flags: String
    let price: Double
    let lastupdate: Int
    let lastvolume, lastvolumeto: Double
    let lasttradeid: String
    let volume24Hour, volume24Hourto, open24Hour, high24Hour: Double
    let low24Hour, change24Hour, changepct24Hour: Double
    let changeday, changepctday, supply: Int
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
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
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
