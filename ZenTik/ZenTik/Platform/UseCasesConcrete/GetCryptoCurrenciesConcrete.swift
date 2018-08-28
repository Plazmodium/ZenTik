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
        
        let url = "https://min-api.cryptocompare.com/data/all/coinlist"
        
        HTTPHelperClass.networkCallGet(urlString: url, parserType: CryptoParserCryptoCompare.self) { (decodable) in
            
            switch(decodable){
                
            case .success(let assets):
                
                let parsedData = assets
                parsedData.data.forEach({ (key,value) in
                    
                    self.datum.append(value)
                })
                
                self.cryptoCurrenciesModel = self.datum.map(CryptoModelCryptoCompare.init)
                completionHandler(self.cryptoCurrenciesModel)
                
            case .failure(let error):
                 print("Error in getting crypto currencies: \(error.localizedDescription)")
            }
            
        }
        

//        self.networkCall.getAssets { (results) in
//
//            switch(results){
//            case .success(let assets):
//
//                let parsedData = assets
//                parsedData.data.forEach({ (key,value) in
//
//                    self.datum.append(value)
//                })
//
//                self.cryptoCurrenciesModel = self.datum.map(CryptoModelCryptoCompare.init)
//
//                completionHandler(self.cryptoCurrenciesModel)
//
//
//            case .failure(let error):
//                print("Error in getting crypto currencies: \(error.localizedDescription)")
//            }
//        }
    }
}
