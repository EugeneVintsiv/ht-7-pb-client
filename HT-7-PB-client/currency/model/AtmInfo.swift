//
//  AtmInfo.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/27/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation
public struct AtmInfo: Codable {
    let address: String
    let city: String
    let devices: [Devex]
    
    public struct Devex: Codable {
        let cityEN: String
        let cityRU: String
        let cityUA: String
        let fullAddressEn: String
        let fullAddressRu: String
        let fullAddressUa: String
        let latitude: String
        let longitude: String
        let placeRu: String
        let placeUa: String
        let tw: Tw
        let type: String
        
        public struct Tw: Codable {
            let fri: String
            let hol: String
            let mon: String
            let sat: String
            let sun: String
            let thu: String
            let tue: String
            let wed: String
        }
    }
}

// MARK: -

extension AtmInfo.Devex.Tw {
    static func create(with data: Data) throws -> AtmInfo.Devex.Tw  {
        return try JSONDecoder().decode(AtmInfo.Devex.Tw.self, from: data)
    }
    
    static func create(with data: Data) throws -> [AtmInfo.Devex.Tw]  {
        return try JSONDecoder().decode([AtmInfo.Devex.Tw].self, from: data)
    }
}

// MARK: -

extension AtmInfo {
    static func create(with data: Data) throws -> AtmInfo  {
        return try JSONDecoder().decode(AtmInfo.self, from: data)
    }
    
    static func create(with data: Data) throws -> [AtmInfo]  {
        return try JSONDecoder().decode([AtmInfo].self, from: data)
    }
}

// MARK: -

extension AtmInfo.Devex {
    static func create(with data: Data) throws -> AtmInfo.Devex  {
        return try JSONDecoder().decode(AtmInfo.Devex.self, from: data)
    }
    
    static func create(with data: Data) throws -> [AtmInfo.Devex]  {
        return try JSONDecoder().decode([AtmInfo.Devex].self, from: data)
    }
}
