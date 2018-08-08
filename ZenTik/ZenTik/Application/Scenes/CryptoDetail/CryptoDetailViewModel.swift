//
//  CryptoDetailViewModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/30.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation
import UIKit

final public class CryptoDetailViewModel{
    
    //    var priceMultiModel = [PriceMultiModel]()
    var priceMultiModel :PriceMultiModel!
    
    init(getPriceMultiUseCase:GetPriceMultiConcrete<Any>, chosenExchange:String, chosenCurrency:String, cryptoCoin:String , completionHandler:@escaping() -> ()){
        
        getPriceMultiUseCase.GetTheMultiplePrices(exchange: chosenExchange, currency: chosenCurrency, cryptoCoin: cryptoCoin) { (model) in
            
            if(model as? String == "The data couldn’t be read because it is missing."){
                
                self.priceMultiModel = PriceMultiModel(type: "", market: "", fromsymbol: "", tosymbol: "", flags: "", price: 0.00, lastupdate: 0, lastvolume: 0.00, lastvolumeto: 0.00, lasttradeid: "", volume24Hour: 0, volume24Hourto: 0.00, open24Hour: 0.00, high24Hour: 0.00, low24Hour: 0.00, change24Hour: 0.00, changepct24Hour: 0.00, changeday: 0, changepctday: 0, supply: 0, mktcap: 0.00, totalvolume24H: 0.00, totalvolume24Hto: 0.00)
            
                completionHandler()
                
            }else{
                
                let model = model as! PriceMultiModel
                
                self.priceMultiModel = PriceMultiModel(type: model.type, market: model.market, fromsymbol: model.fromsymbol, tosymbol: model.tosymbol, flags: model.flags, price: model.price, lastupdate: model.lastupdate, lastvolume: model.lastvolume, lastvolumeto: model.lastvolumeto, lasttradeid: model.lasttradeid, volume24Hour: model.volume24Hour, volume24Hourto: model.volume24Hourto, open24Hour: model.open24Hour, high24Hour: model.high24Hour, low24Hour: model.low24Hour, change24Hour: model.change24Hour, changepct24Hour: model.changepct24Hour, changeday: model.changeday, changepctday: model.changepctday, supply: model.supply, mktcap: model.mktcap, totalvolume24H: model.totalvolume24H, totalvolume24Hto: model.totalvolume24Hto)
                
                completionHandler()
            }
        }
    }
}
