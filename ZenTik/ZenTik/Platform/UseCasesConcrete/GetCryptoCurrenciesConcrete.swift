//
//  GetCryptoCurrenciesConcrete.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/23.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final class GetCryptoCurrenciesConcrete:GetCryptoCurrencies{
    
    var networkCall = GetAssetsCryptoCompare<CryptoParserCryptoCompare>()
    var cryptoCurrenciesModel = [CryptoModelCryptoCompare]()
    var datum = [Datum]()
    
    func GetCryptoCurrencies(completionHandler: @escaping ([CryptoModelCryptoCompare]) -> Void) {
        
        self.networkCall.getAssets { (results) in
            
            switch(results){
            case .success(let assets):
                
                let parsedData = assets
                parsedData.data.forEach({ (key,value) in
                    
                    self.datum.append(value)
                })
                
                for i in self.datum{
                    
                    let model = CryptoModelCryptoCompare(id: i.id,
                                                         url: i.url,
                                                         imageURL: i.imageURL,
                                                         name: i.name,
                                                         symbol: i.symbol,
                                                         coinName: i.coinName,
                                                         fullName: i.fullName,
                                                         algorithm: i.algorithm,
                                                         proofType: i.proofType,
                                                         fullyPremined: i.fullyPremined,
                                                         totalCoinSupply: i.totalCoinSupply,
                                                         preMinedValue: i.preMinedValue.rawValue,
                                                         totalCoinsFreeFloat: i.totalCoinsFreeFloat.rawValue,
                                                         sortOrder: i.sortOrder,
                                                         sponsored: i.sponsored,
                                                         isTrading: i.isTrading)
                    
                    self.cryptoCurrenciesModel.append(model)
                }
                
                
                completionHandler(self.cryptoCurrenciesModel)
                
                
            case .failure(let error):
                print("Error in getting crypto currencies: \(error.localizedDescription)")
            }
        }
    }
}
