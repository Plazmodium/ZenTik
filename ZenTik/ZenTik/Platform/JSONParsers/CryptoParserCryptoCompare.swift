//
//  CryptoParserCryptoCompare.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/19.
//  Copyright © 2018 Wodwo. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let cryptoParser = try? JSONDecoder().decode(CryptoParser.self, from: jsonData)

import Foundation

struct CryptoParserCryptoCompare: Codable {
    let response, message, baseImageURL, baseLinkURL: String
    let defaultWatchlist: DefaultWatchlist
    let sponosoredNews: [SponosoredNew]
    let data: [String: Datum]
    let type: Int
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case message = "Message"
        case baseImageURL = "BaseImageUrl"
        case baseLinkURL = "BaseLinkUrl"
        case defaultWatchlist = "DefaultWatchlist"
        case sponosoredNews = "SponosoredNews"
        case data = "Data"
        case type = "Type"
    }
}

struct Datum: Codable {
    let id, url: String
    let imageURL: String?
    let name, symbol, coinName, fullName: String
    let algorithm, proofType, fullyPremined, totalCoinSupply: String
    let preMinedValue, totalCoinsFreeFloat: PreMinedValue
    let sortOrder: String
    let sponsored, isTrading: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
        case imageURL = "ImageUrl"
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
        case algorithm = "Algorithm"
        case proofType = "ProofType"
        case fullyPremined = "FullyPremined"
        case totalCoinSupply = "TotalCoinSupply"
        case preMinedValue = "PreMinedValue"
        case totalCoinsFreeFloat = "TotalCoinsFreeFloat"
        case sortOrder = "SortOrder"
        case sponsored = "Sponsored"
        case isTrading = "IsTrading"
    }
}

enum PreMinedValue: String, Codable {
    case nA = "N/A"
}

struct DefaultWatchlist: Codable {
    let coinIs, sponsored: String
    
    enum CodingKeys: String, CodingKey {
        case coinIs = "CoinIs"
        case sponsored = "Sponsored"
    }
}

struct SponosoredNew: Codable {
    let id: Int
    let guid: String
    let publishedOn: Int
    let imageurl, title, url, source: String
    let body, tags, categories, lang: String
    let sourceInfo: SourceInfo
    
    enum CodingKeys: String, CodingKey {
        case id, guid
        case publishedOn = "published_on"
        case imageurl, title, url, source, body, tags, categories, lang
        case sourceInfo = "source_info"
    }
}

struct SourceInfo: Codable {
}

