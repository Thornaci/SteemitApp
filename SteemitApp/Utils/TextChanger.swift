//
//  TextChanger.swift
//  SteemitApp
//
//  Created by Burak Tayfun on 1/8/18.
//  Copyright © 2018 Burak Tayfun. All rights reserved.
//

import UIKit

struct TextChanger {
    func changeCurrency(currency: String) -> CurrencyTypes {
        switch currency {
        case "USD":
            return CurrencyTypes.dolar
        case "Euro":
            return CurrencyTypes.euro
        case "TL":
            return CurrencyTypes.turkishLiras
        case "KRW":
            return CurrencyTypes.koreanWon
        case "Ruble":
            return CurrencyTypes.ruble
        default:
            return CurrencyTypes.noType
        }
    }
    
    func changeCurrencyWithSymbol(currency: String, currencyType: CurrencyTypes) -> String {
        let temp = currency.components(separatedBy: ".")
        if temp.count == 2 {
            var index:String.Index
            if temp[1].count > 2 {
                index = temp[1].index(temp[1].startIndex, offsetBy: 2)
            } else {
                index = temp[1].index(temp[1].startIndex, offsetBy: 1)
            }
            
            switch currencyType {
            case .dolar:
                return changeTotalAmountText(preMoney: temp[0],
                                            afterDot: String(temp[1].prefix(upTo: index)),
                                            symbol: CurrencySymbol.dolar.rawValue)
            case .euro:
                return changeTotalAmountText(preMoney: temp[0],
                                            afterDot: String(temp[1].prefix(upTo: index)),
                                            symbol: CurrencySymbol.euro.rawValue)
            case .turkishLiras:
                return changeTotalAmountText(preMoney: temp[0],
                                            afterDot: String(temp[1].prefix(upTo: index)),
                                            symbol: CurrencySymbol.turkishLiras.rawValue)
            case .koreanWon:
                return changeTotalAmountText(preMoney: temp[0],
                                            afterDot: String(temp[1].prefix(upTo: index)),
                                            symbol: CurrencySymbol.koreanWon.rawValue)
            case .ruble:
                return changeTotalAmountText(preMoney: temp[0],
                                            afterDot: String(temp[1].prefix(upTo: index)),
                                            symbol: CurrencySymbol.ruble.rawValue)
            default:
                return "An error appeared."
            }
        } else {
            return "An error appeared."
        }
    }
    
    private func changeTotalAmountText(preMoney: String, afterDot: String, symbol: String) -> String {
        return ("SBD equals to " + preMoney + "." + afterDot + " " + symbol)
    }
}
