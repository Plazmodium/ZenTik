//
//  GetPriceMultiConcrete.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/07/01.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final class GetPriceMultiConcrete<T>: GetTheMultiPrice {
        
    func GetTheMultiplePrices(exchange: String, currency:String, cryptoCoin:String, completionHandler: @escaping (T) -> Void) {
        
        let urlString = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=\(cryptoCoin)&tsyms=\(currency)&e=\(exchange)&extraParams=ZenTik"
        
        HTTPHelperClass.networkCallGet(urlString: urlString, parserType: PriceMultiParser.self) { (results) in
            
            
            switch results{
                
            case .success(let ticks):
                let parsedData = ticks
                
                switch currency{
                    
                case "USD":
                    
                    let multiPriceModelUSD = PriceMultiModel.init(parser: parsedData)
                    
//                    let multiPriceModelUSD = PriceMultiModel(type: parsedData.raw.btc.usd.type,
//                                                             market: parsedData.raw.btc.usd.market,
//                                                             fromsymbol: parsedData.raw.btc.usd.fromsymbol,
//                                                             tosymbol: parsedData.raw.btc.usd.tosymbol,
//                                                             flags: parsedData.raw.btc.usd.flags,
//                                                             price: parsedData.raw.btc.usd.price,
//                                                             lastupdate: parsedData.raw.btc.usd.lastupdate,
//                                                             lastvolume: parsedData.raw.btc.usd.lastvolume,
//                                                             lastvolumeto: parsedData.raw.btc.usd.lastvolumeto,
//                                                             lasttradeid: parsedData.raw.btc.usd.lasttradeid,
//                                                             volume24Hour: parsedData.raw.btc.usd.volume24Hour,
//                                                             volume24Hourto: parsedData.raw.btc.usd.volume24Hourto,
//                                                             open24Hour: parsedData.raw.btc.usd.open24Hour,
//                                                             high24Hour: parsedData.raw.btc.usd.high24Hour,
//                                                             low24Hour: parsedData.raw.btc.usd.low24Hour,
//                                                             change24Hour: parsedData.raw.btc.usd.change24Hour,
//                                                             changepct24Hour: parsedData.raw.btc.usd.changepct24Hour,
//                                                             changeday: parsedData.raw.btc.usd.changeday,
//                                                             changepctday: parsedData.raw.btc.usd.changepctday,
//                                                             supply: parsedData.raw.btc.usd.supply,
//                                                             mktcap: parsedData.raw.btc.usd.mktcap,
//                                                             totalvolume24H: parsedData.raw.btc.usd.totalvolume24H,
//                                                             totalvolume24Hto: parsedData.raw.btc.usd.totalvolume24Hto)
                    
                    completionHandler(multiPriceModelUSD as! T)
                    
//                case "EUR":
                    
//                    let multiPriceModelEUR = PriceMultiModel(type: parsedData.raw.btc.eur.type,
//                                                             market: parsedData.raw.btc.eur.market,
//                                                             fromsymbol: parsedData.raw.btc.eur.fromsymbol,
//                                                             tosymbol: parsedData.raw.btc.eur.tosymbol,
//                                                             flags: parsedData.raw.btc.eur.flags,
//                                                             price: parsedData.raw.btc.eur.price,
//                                                             lastupdate: parsedData.raw.btc.eur.lastupdate,
//                                                             lastvolume: parsedData.raw.btc.eur.lastvolume,
//                                                             lastvolumeto: parsedData.raw.btc.eur.lastvolumeto,
//                                                             lasttradeid: parsedData.raw.btc.eur.lasttradeid,
//                                                             volume24Hour: parsedData.raw.btc.eur.volume24Hour,
//                                                             volume24Hourto: parsedData.raw.btc.eur.volume24Hourto,
//                                                             open24Hour: parsedData.raw.btc.eur.open24Hour,
//                                                             high24Hour: parsedData.raw.btc.eur.high24Hour,
//                                                             low24Hour: parsedData.raw.btc.eur.low24Hour,
//                                                             change24Hour: parsedData.raw.btc.eur.change24Hour,
//                                                             changepct24Hour: parsedData.raw.btc.eur.changepct24Hour,
//                                                             changeday: parsedData.raw.btc.eur.changeday,
//                                                             changepctday: parsedData.raw.btc.eur.changepctday,
//                                                             supply: parsedData.raw.btc.eur.supply,
//                                                             mktcap: parsedData.raw.btc.eur.mktcap,
//                                                             totalvolume24H: parsedData.raw.btc.eur.totalvolume24H,
//                                                             totalvolume24Hto: parsedData.raw.btc.eur.totalvolume24Hto)
                    
//                    completionHandler(multiPriceModelEUR as! T)
                    
//                case "GBP":
                    
//                    let multiPriceModelGBP = PriceMultiModel(type: parsedData.raw.btc.gbp.type,
//                                                             market: parsedData.raw.btc.gbp.market,
//                                                             fromsymbol: parsedData.raw.btc.gbp.fromsymbol,
//                                                             tosymbol: parsedData.raw.btc.gbp.tosymbol,
//                                                             flags: parsedData.raw.btc.gbp.flags,
//                                                             price: parsedData.raw.btc.gbp.price,
//                                                             lastupdate: parsedData.raw.btc.gbp.lastupdate,
//                                                             lastvolume: parsedData.raw.btc.gbp.lastvolume,
//                                                             lastvolumeto: parsedData.raw.btc.gbp.lastvolumeto,
//                                                             lasttradeid: parsedData.raw.btc.gbp.lasttradeid,
//                                                             volume24Hour: parsedData.raw.btc.gbp.volume24Hour,
//                                                             volume24Hourto: parsedData.raw.btc.gbp.volume24Hourto,
//                                                             open24Hour: parsedData.raw.btc.gbp.open24Hour,
//                                                             high24Hour: parsedData.raw.btc.gbp.high24Hour,
//                                                             low24Hour: parsedData.raw.btc.gbp.low24Hour,
//                                                             change24Hour: parsedData.raw.btc.gbp.change24Hour,
//                                                             changepct24Hour: parsedData.raw.btc.gbp.changepct24Hour,
//                                                             changeday: parsedData.raw.btc.gbp.changeday,
//                                                             changepctday: parsedData.raw.btc.gbp.changepctday,
//                                                             supply: parsedData.raw.btc.gbp.supply,
//                                                             mktcap: parsedData.raw.btc.gbp.mktcap,
//                                                             totalvolume24H: parsedData.raw.btc.gbp.totalvolume24H,
//                                                             totalvolume24Hto: parsedData.raw.btc.gbp.totalvolume24Hto)
                    
//                    completionHandler(multiPriceModelGBP as! T)
                    
                default:
                    break
                }
                
            case .failure(let error):
                //print("Error in getting multi prices: \(error)")
                completionHandler(error as! T)
            }
        }
    }
}
    
    /*
        OLD CODE BELOW FOR CUSTOM NETWORK CALLS
    */

//self.networkCall.GetMultiPrice(for: exchange, for: cryptoCoin) { (results) in
//    //
//    switch results{
//
//    case .success(let ticks):
//        let parsedData = ticks
//
//        switch currency{
//
//        case "USD":
//
//            let multiPriceModelUSD = PriceMultiModel(type: parsedData.raw.btc.usd.type,
//                                                     market: parsedData.raw.btc.usd.market,
//                                                     fromsymbol: parsedData.raw.btc.usd.fromsymbol,
//                                                     tosymbol: parsedData.raw.btc.usd.tosymbol,
//                                                     flags: parsedData.raw.btc.usd.flags,
//                                                     price: parsedData.raw.btc.usd.price,
//                                                     lastupdate: parsedData.raw.btc.usd.lastupdate,
//                                                     lastvolume: parsedData.raw.btc.usd.lastvolume,
//                                                     lastvolumeto: parsedData.raw.btc.usd.lastvolumeto,
//                                                     lasttradeid: parsedData.raw.btc.usd.lasttradeid,
//                                                     volume24Hour: parsedData.raw.btc.usd.volume24Hour,
//                                                     volume24Hourto: parsedData.raw.btc.usd.volume24Hourto,
//                                                     open24Hour: parsedData.raw.btc.usd.open24Hour,
//                                                     high24Hour: parsedData.raw.btc.usd.high24Hour,
//                                                     low24Hour: parsedData.raw.btc.usd.low24Hour,
//                                                     change24Hour: parsedData.raw.btc.usd.change24Hour,
//                                                     changepct24Hour: parsedData.raw.btc.usd.changepct24Hour,
//                                                     changeday: parsedData.raw.btc.usd.changeday,
//                                                     changepctday: parsedData.raw.btc.usd.changepctday,
//                                                     supply: parsedData.raw.btc.usd.supply,
//                                                     mktcap: parsedData.raw.btc.usd.mktcap,
//                                                     totalvolume24H: parsedData.raw.btc.usd.totalvolume24H,
//                                                     totalvolume24Hto: parsedData.raw.btc.usd.totalvolume24Hto)
//
//            completionHandler(multiPriceModelUSD as! T)
//
//        case "EUR":
//
//            let multiPriceModelEUR = PriceMultiModel(type: parsedData.raw.btc.eur.type,
//                                                     market: parsedData.raw.btc.eur.market,
//                                                     fromsymbol: parsedData.raw.btc.eur.fromsymbol,
//                                                     tosymbol: parsedData.raw.btc.eur.tosymbol,
//                                                     flags: parsedData.raw.btc.eur.flags,
//                                                     price: parsedData.raw.btc.eur.price,
//                                                     lastupdate: parsedData.raw.btc.eur.lastupdate,
//                                                     lastvolume: parsedData.raw.btc.eur.lastvolume,
//                                                     lastvolumeto: parsedData.raw.btc.eur.lastvolumeto,
//                                                     lasttradeid: parsedData.raw.btc.eur.lasttradeid,
//                                                     volume24Hour: parsedData.raw.btc.eur.volume24Hour,
//                                                     volume24Hourto: parsedData.raw.btc.eur.volume24Hourto,
//                                                     open24Hour: parsedData.raw.btc.eur.open24Hour,
//                                                     high24Hour: parsedData.raw.btc.eur.high24Hour,
//                                                     low24Hour: parsedData.raw.btc.eur.low24Hour,
//                                                     change24Hour: parsedData.raw.btc.eur.change24Hour,
//                                                     changepct24Hour: parsedData.raw.btc.eur.changepct24Hour,
//                                                     changeday: parsedData.raw.btc.eur.changeday,
//                                                     changepctday: parsedData.raw.btc.eur.changepctday,
//                                                     supply: parsedData.raw.btc.eur.supply,
//                                                     mktcap: parsedData.raw.btc.eur.mktcap,
//                                                     totalvolume24H: parsedData.raw.btc.eur.totalvolume24H,
//                                                     totalvolume24Hto: parsedData.raw.btc.eur.totalvolume24Hto)
//
//            completionHandler(multiPriceModelEUR as! T)
//
//        case "GBP":
//
//            let multiPriceModelGBP = PriceMultiModel(type: parsedData.raw.btc.gbp.type,
//                                                     market: parsedData.raw.btc.gbp.market,
//                                                     fromsymbol: parsedData.raw.btc.gbp.fromsymbol,
//                                                     tosymbol: parsedData.raw.btc.gbp.tosymbol,
//                                                     flags: parsedData.raw.btc.gbp.flags,
//                                                     price: parsedData.raw.btc.gbp.price,
//                                                     lastupdate: parsedData.raw.btc.gbp.lastupdate,
//                                                     lastvolume: parsedData.raw.btc.gbp.lastvolume,
//                                                     lastvolumeto: parsedData.raw.btc.gbp.lastvolumeto,
//                                                     lasttradeid: parsedData.raw.btc.gbp.lasttradeid,
//                                                     volume24Hour: parsedData.raw.btc.gbp.volume24Hour,
//                                                     volume24Hourto: parsedData.raw.btc.gbp.volume24Hourto,
//                                                     open24Hour: parsedData.raw.btc.gbp.open24Hour,
//                                                     high24Hour: parsedData.raw.btc.gbp.high24Hour,
//                                                     low24Hour: parsedData.raw.btc.gbp.low24Hour,
//                                                     change24Hour: parsedData.raw.btc.gbp.change24Hour,
//                                                     changepct24Hour: parsedData.raw.btc.gbp.changepct24Hour,
//                                                     changeday: parsedData.raw.btc.gbp.changeday,
//                                                     changepctday: parsedData.raw.btc.gbp.changepctday,
//                                                     supply: parsedData.raw.btc.gbp.supply,
//                                                     mktcap: parsedData.raw.btc.gbp.mktcap,
//                                                     totalvolume24H: parsedData.raw.btc.gbp.totalvolume24H,
//                                                     totalvolume24Hto: parsedData.raw.btc.gbp.totalvolume24Hto)
//
//            completionHandler(multiPriceModelGBP as! T)
//
//        default:
//            break
//        }
//
//    case .failure(let error):
//        //print("Error in getting multi prices: \(error)")
//
//        completionHandler(error as! T)
//    }
//}
//
//
//
