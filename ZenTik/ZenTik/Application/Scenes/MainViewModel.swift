//
//  MainViewModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

class MainViewModel{
    
    let getAssets = GetAssetsNetwork<Any>()
    var cryptoModel = [CryptoModel]()
    
    func getTheAssets(apiKey:String){
        
        getAssets.getAssets(for: apiKey) { (result) in
            
            switch result{
                
            case .success(let assets):
                self.cryptoModel = assets as! [CryptoModel]
            case .failure(let error):
//                 fatalError("error: \(error.localizedDescription)")
                print(error.localizedDescription)
            }
        }
    }
}
