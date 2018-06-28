//
//  MainViewModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final public class MainViewModel{
    
    var searchText :String!
    
    let getAssets = GetAssetsCryptoCompare<Any>()
    var cryptoModel = [CryptoModelCryptoCompare]()
    
    var cryptoModelCoinAPI = [CryptoModel]()
    var cryptoModelCryptoCompare = [CryptoModelCryptoCompare]()
    
    var datum = [Datum]()
    var getCurrenciesUseCase = GetCurrenciesConcrete()
    var getCryptoCurrenciesUseCase = GetCryptoCurrenciesConcrete()
    
    
    func getAssetsFromCoinIOAPI(apiKey:String){
        
        getCurrenciesUseCase.GetTheCryptoCurrencies(for: apiKey) { (data) in
            self.cryptoModelCoinAPI = data
            
            let coins = ["data":self.cryptoModelCoinAPI]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CryptoData"), object: nil, userInfo: coins)
        }
    }
    
    func getAssetsFromCryptoCompare(){
        
        getCryptoCurrenciesUseCase.GetCryptoCurrencies { (data) in
            self.cryptoModelCryptoCompare = data
            
            let cryptoCoins = ["crypto":self.cryptoModelCryptoCompare]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CryptoCoins"), object: nil, userInfo: cryptoCoins)
        }
    }

//    func getTheAssets(completionHandler:@escaping([CryptoModelCryptoCompare]) -> Void) {
//
//        getAssets.getAssets() { (result) in
//
//            switch result{
//
//            case .success(let assets):
//
//                let parsedData = assets as! CryptoParserCryptoCompare
//                parsedData.data.forEach({ (key,value) in
//
//                    self.datum.append(value)
//                })
//
//                for i in self.datum{
//
//                    let model = CryptoModelCryptoCompare(id: i.id,
//                                                         url: i.url,
//                                                         imageURL: i.imageURL,
//                                                         name: i.name,
//                                                         symbol: i.symbol,
//                                                         coinName: i.coinName,
//                                                         fullName: i.fullName,
//                                                         algorithm: i.algorithm,
//                                                         proofType: i.proofType,
//                                                         fullyPremined: i.fullyPremined,
//                                                         totalCoinSupply: i.totalCoinSupply,
//                                                         preMinedValue: i.preMinedValue.rawValue,
//                                                         totalCoinsFreeFloat: i.totalCoinsFreeFloat.rawValue,
//                                                         sortOrder: i.sortOrder,
//                                                         sponsored: i.sponsored,
//                                                         isTrading: i.isTrading)
//                    self.cryptoModel.append(model)
//                }
//
//                completionHandler(self.cryptoModel)
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}
