//
//  GetCurrenciesConcrete.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/08.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final class GetCurrenciesConcrete : GetCurrencies{
    
    let makeAssetsNetworkCall = GetAssetsNetwork<CryptoParser>()
    var assetDataModel = [CryptoModel]()
    
//    init(assetsNetworkCall: GetAssetsNetwork<CryptoModel>){
//        self.makeAssetsNetworkCall = assetsNetworkCall
//    }
    
    func GetTheCryptoCurrencies(for apikey:String, completionHandler: @escaping ([CryptoModel]) -> Void) {
        
        self.makeAssetsNetworkCall.getAssets(for: apikey, completionHandler: { (results) in

            switch results{
                
            case .success(let assets):
               
                for i in assets{
                    
                    let model = CryptoModel(assest_id: i.assetID,
                                                       name: i.name,
                                                       isCrypto: i.typeIsCrypto,
                                                       dateStarted: i.dataTradeStart ?? "No data")
                    
                    self.assetDataModel.append(model)
                }
                
                completionHandler(self.assetDataModel)
                
            case .failure(let error):
                fatalError("error: \(error.localizedDescription)")
//                print(error.localizedDescription)
            }
        })
    }
}
