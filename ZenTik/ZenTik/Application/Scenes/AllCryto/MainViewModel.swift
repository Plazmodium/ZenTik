//
//  MainViewModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final public class MainViewModel{
    
    var cryptoModelCryptoCompare = [CryptoModelCryptoCompare]()
    
    init(getCrypoCoins:GetCryptoCurrenciesConcrete, completionHandler: @escaping () -> ()){
        
        getCrypoCoins.GetCryptoCurrencies { (modelData) in
            
            self.cryptoModelCryptoCompare = modelData
            completionHandler()
        }
    }
}

