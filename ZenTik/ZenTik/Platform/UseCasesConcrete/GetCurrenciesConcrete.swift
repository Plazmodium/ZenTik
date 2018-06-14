//
//  GetCurrenciesConcrete.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/08.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final class GetCurrenciesConcrete : GetCurrencies{
    
    let makeAssetsNetworkCall: GetAssetsNetwork<CryptoModel>
    var assetDataModel = [CryptoModel]()
    
    init(assetsNetworkCall: GetAssetsNetwork<CryptoModel>){
        self.makeAssetsNetworkCall = assetsNetworkCall
    }
    
    func GetTheCryptoCurrencies(apiKey apikey:String) -> [CryptoModel] {
        
        self.makeAssetsNetworkCall.getAssets(for: apikey, completionHandler: { (results) in

            switch results{
                
            case .success(let assets):
                self.assetDataModel = assets
            case .failure(let error):
                //                 fatalError("error: \(error.localizedDescription)")
                print(error.localizedDescription)
            }
        })
        return self.assetDataModel
    }
}
