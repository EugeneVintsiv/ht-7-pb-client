//
//  PBCurrencyInfo.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/27/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

public struct PbCurrencyInfo: Codable {
    let baseCcy: String
    let buy: String
    let ccy: String
    let sale: String
    
    private enum CodingKeys: String, CodingKey {
        case baseCcy = "base_ccy"
        case buy
        case ccy
        case sale
    }


}

// MARK: -

extension PbCurrencyInfo {
    static func create(with data: Data) throws -> PbCurrencyInfo  {
        return try JSONDecoder().decode(PbCurrencyInfo.self, from: data)
    }
    
    static func create(with data: Data) throws -> [PbCurrencyInfo]  {
            return try JSONDecoder().decode([PbCurrencyInfo].self, from: data)
    }
}
