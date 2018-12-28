//
//  CurrencyService.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/28/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

protocol CurrencyService {
    func getCurrencies() -> [PbCurrencyInfo]
}

class CurrencyServiceImpl: CurrencyService {
    private let pbApi: PbApi
    
    init() {
        pbApi = PbApi()
    }
    
    func getCurrencies() -> [PbCurrencyInfo] {
        return pbApi.getCurrencies()
    }
    
    
    
}
