////
////  GetCurrenciesConcrete.swift
////  ZenTik
////
////  Created by Gabor Racz on 2018/06/08.
////  Copyright © 2018 Wodwo. All rights reserved.
////
//
//import Foundation
//
//final class GetCurrenciesConcrete : GetCurrencies{
//
//    let makeAssetsNetworkCall = GetAssetsNetwork<CryptoParser>()
//    var assetDataModel = [CryptoModel]()
//
//    func GetTheCryptoCurrencies(for apikey:String, completionHandler: @escaping ([CryptoModel]) -> Void) {
//
//        self.makeAssetsNetworkCall.getAssets(for: apikey, completionHandler: { (results) in
//
//            switch results{
//
//            case .success(let assets):
//
//                self.assetDataModel = assets.map(CryptoModel.init)
//
//                completionHandler(self.assetDataModel)
//
//            case .failure(let error):
//                fatalError("error: \(error.localizedDescription)")
////                print(error.localizedDescription)
//            }
//        })
//    }
//}
