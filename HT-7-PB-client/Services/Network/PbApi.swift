//
//  PbApi.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/28/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation
import UIKit

protocol PbNetworkApi {
    func getCurrencies() -> [PbCurrencyInfo]
}


class PbApi : PbNetworkApi {
    func getCurrencies() -> [PbCurrencyInfo] {

        let jsonStr: String = "[{\"ccy\":\"USD\",\"base_ccy\":\"UAH\",\"buy\":\"27.40000\",\"sale\":\"27.70083\"},{\"ccy\":\"EUR\",\"base_ccy\":\"UAH\",\"buy\":\"31.05000\",\"sale\":\"31.64557\"},{\"ccy\":\"RUR\",\"base_ccy\":\"UAH\",\"buy\":\"0.37500\",\"sale\":\"0.40501\"},{\"ccy\":\"BTC\",\"base_ccy\":\"USD\",\"buy\":\"3447.7226\",\"sale\":\"3810.6408\"}]"
        print(jsonStr)
        let t = jsonStr.data(using: String.Encoding.utf8)
        print(t)
        do {
            let res: [PbCurrencyInfo] = try PbCurrencyInfo.create(with: t!)
            print(res)
            return res
        } catch {
            print("Error during parse")
            return []
        }
    }
}
