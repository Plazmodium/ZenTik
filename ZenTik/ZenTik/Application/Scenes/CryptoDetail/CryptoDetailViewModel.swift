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
    
    init(getPriceMultiUseCase:GetPriceMultiConcrete, chosenExchange:String, chosenCurrency:String, completionHandler:@escaping() -> ()){
        
        getPriceMultiUseCase.GetTheMultiplePrices(exchange: chosenExchange, currency: chosenCurrency) { (model) in
            
//            for i in self.priceMultiModel {
//                i.type = model.type
//                i.market = model.market
//                i.fromsymbol = model.fromsymbol
//                i.tosymbol = model.tosymbol
//                i.flags = model.flags
//                i.price = model.price
//                i.lastupdate = model.lastupdate
//                i.lastvolume = model.lastvolume
//                i.lastvolumeto = model.lastvolumeto
//                i.lasttradeid = model.lasttradeid
//                i.volume24Hour = model.volume24Hour
//                i.volume24Hourto = model.volume24Hourto
//                i.open24Hour = model.open24Hour
//                i.high24Hour = model.high24Hour
//                i.low24Hour = model.low24Hour
//                i.change24Hour = model.change24Hour
//                i.changepct24Hour = model.changepct24Hour
//                i.changeday = model.changeday
//                i.changepctday = model.changepctday
//                i.supply = model.supply
//                i.mktcap = model.mktcap
//                i.totalvolume24H = model.totalvolume24H
//                i.totalvolume24Hto = model.totalvolume24Hto
//            }
            
            self.priceMultiModel = PriceMultiModel(type: model.type, market: model.market, fromsymbol: model.fromsymbol, tosymbol: model.tosymbol, flags: model.flags, price: model.price, lastupdate: model.lastupdate, lastvolume: model.lastvolume, lastvolumeto: model.lastvolumeto, lasttradeid: model.lasttradeid, volume24Hour: model.volume24Hour, volume24Hourto: model.volume24Hourto, open24Hour: model.open24Hour, high24Hour: model.high24Hour, low24Hour: model.low24Hour, change24Hour: model.change24Hour, changepct24Hour: model.changepct24Hour, changeday: model.changeday, changepctday: model.changepctday, supply: model.supply, mktcap: model.mktcap, totalvolume24H: model.totalvolume24H, totalvolume24Hto: model.totalvolume24Hto)
            completionHandler()
        }
    }
}
