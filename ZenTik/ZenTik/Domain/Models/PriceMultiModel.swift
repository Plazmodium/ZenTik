//
//  PriceMultiModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/07/01.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

class PriceMultiModel{
    
    var type : String!
    var market : String!
    var fromsymbol : String!
    var tosymbol : String!
    var flags : String!
    var price : Double!
    var lastupdate : Int!
    var lastvolume : Double!
    var lastvolumeto : Double!
    var lasttradeid : String!
    var volume24Hour : Double!
    var volume24Hourto : Double!
    var open24Hour : Double!
    var high24Hour : Double!
    var low24Hour : Double!
    var change24Hour : Double!
    var changepct24Hour : Double!
    var changeday : Int!
    var changepctday : Int!
    var supply : Int!
    var mktcap : Double!
    var totalvolume24H : Double!
    var totalvolume24Hto : Double!
    
    init(type :String,
         market :String,
         fromsymbol :String,
         tosymbol :String,
         flags :String,
         price :Double,
         lastupdate :Int,
         lastvolume :Double,
         lastvolumeto :Double,
         lasttradeid :String,
         volume24Hour :Double,
         volume24Hourto :Double,
         open24Hour :Double,
         high24Hour :Double,
         low24Hour :Double,
         change24Hour :Double,
         changepct24Hour :Double,
         changeday :Int,
         changepctday :Int,
         supply :Int,
         mktcap :Double,
         totalvolume24H :Double,
         totalvolume24Hto :Double) {
        
        self.type = type
        self.market = market
        self.fromsymbol = fromsymbol
        self.tosymbol = tosymbol
        self.flags = flags
        self.price = price
        self.lastupdate = lastupdate
        self.lastvolume = lastvolume
        self.lastvolumeto = lastvolumeto
        self.lasttradeid = lasttradeid
        self.volume24Hour = volume24Hour
        self.volume24Hourto = volume24Hourto
        self.open24Hour = open24Hour
        self.high24Hour = high24Hour
        self.low24Hour = low24Hour
        self.change24Hour = change24Hour
        self.changepct24Hour = changepct24Hour
        self.changeday = changeday
        self.changepctday = changepctday
        self.supply = supply
        self.mktcap = mktcap
        self.totalvolume24H = totalvolume24H
        self.totalvolume24Hto = totalvolume24Hto
    }
}


