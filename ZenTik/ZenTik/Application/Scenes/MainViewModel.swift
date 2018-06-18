//
//  MainViewModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final public class MainViewModel{
    
    let getAssets = GetAssetsNetwork<Any>()
    var cryptoModel = [CryptoModel]()
//    let getCurrenciesUseCase:GetCurrenciesConcrete
//
//    init(getCurrenciesUseCase:GetCurrenciesConcrete){
//        self.getCurrenciesUseCase = getCurrenciesUseCase
//    }
    
    func getTheAssets(apiKey:String, completionHandler:@escaping([CryptoModel]) -> Void) {
        
//        let theAssetsData = getCurrenciesUseCase.GetTheCryptoCurrencies(apiKey: apiKey)
//        self.cryptoModel = theAssetsData

        getAssets.getAssets(for: apiKey) { (result) in

            switch result{

            case .success(let assets):
                let parsedData = assets as! [CryptoParser]
                
                for i in parsedData{
                    
                    let model = CryptoModel(assest_id: i.assetID,
                                            name: i.name,
                                            isCrypto: i.typeIsCrypto,
                                            dateStarted:i.dataStart)
                    
                    self.cryptoModel.append(model)
                }
                completionHandler(self.cryptoModel)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
