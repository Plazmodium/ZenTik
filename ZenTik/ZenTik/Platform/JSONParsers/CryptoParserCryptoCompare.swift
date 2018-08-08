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
    let response, message: String
    let data: [String: Datum]
    let baseImageURL, baseLinkURL: String
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case message = "Message"
        case data = "Data"
        case baseImageURL = "BaseImageUrl"
        case baseLinkURL = "BaseLinkUrl"
    }
}

struct Datum: Codable {
    let id, url: String
    let imageURL: String?
    let name, symbol, coinName, fullName: String
    let algorithm, proofType, fullyPremined, totalCoinSupply: String
    let builtOn, smartContractAddress: String
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
        case builtOn = "BuiltOn"
        case smartContractAddress = "SmartContractAddress"
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
