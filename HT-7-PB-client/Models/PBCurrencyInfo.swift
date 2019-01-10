//
//  PBCurrencyInfo.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/27/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

public struct PbCurrencyInfo: Codable, Model {
    var baseCcy: String?
    var buy: String?
    var ccy: String?
    var sale: String?

    private enum CodingKeys: String, CodingKey {
        case baseCcy = "base_ccy"
        case buy
        case ccy
        case sale
    }

}

// MARK: -

extension PbCurrencyInfo {
    static func makeDefault() -> PbCurrencyInfo {
        return PbCurrencyInfo(baseCcy: "", buy: "", ccy: "", sale: "")
    }

    static func create(with toParse: Data?) -> [PbCurrencyInfo] {
        guard let data = toParse else {
            return [makeDefault()]
        }

        do {
            let object = try JSONDecoder().decode([PbCurrencyInfo].self, from: data)
            return object
        } catch {
            print("Decode PbCurrencyInfo failed")
            return [makeDefault()]
        }
    }

}
