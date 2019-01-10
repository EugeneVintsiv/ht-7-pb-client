//
//  AtmInfo.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/27/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

public struct AtmInfo: Codable, Model {
    let city: String?
    let address: String?
    let devices: [Device]?

    private enum CodingKeys: String, CodingKey {
        case city = "city"
        case address = "address"
        case devices = "devices"
    }

    public struct Device: Codable {
        let type: String?
        let cityRU: String?
        let cityUA: String?
        let cityEN: String?
        let fullAddressRu: String?
        let fullAddressUa: String?
        let fullAddressEn: String?
        let placeRu: String?
        let placeUa: String?
        let latitude: String?
        let longitude: String?
        let tw: Tw?

        private enum CodingKeys: String, CodingKey {
            case type = "type"
            case cityRU = "cityRU"
            case cityUA = "cityUA"
            case cityEN = "cityEN"
            case fullAddressRu = "fullAddressRu"
            case fullAddressUa = "fullAddressUa"
            case fullAddressEn = "fullAddressEn"
            case placeRu = "placeRu"
            case placeUa = "placeUa"
            case latitude = "latitude"
            case longitude = "longitude"
            case tw = "tw"
        }

        public struct Tw: Codable {
            let mon: String?
            let tue: String?
            let wed: String?
            let thu: String?
            let fri: String?
            let sat: String?
            let sun: String?
            let hol: String?

            private enum CodingKeys: String, CodingKey {
                case mon = "mon"
                case tue = "tue"
                case wed = "wed"
                case thu = "thu"
                case fri = "fri"
                case sat = "sat"
                case sun = "sun"
                case hol = "hol"
            }
        }
    }


}

// MARK: -

extension AtmInfo {

    static func makeDefault(city requestedCity: String?, address requestedAddress: String?) -> AtmInfo {
        return AtmInfo(city: requestedCity, address: requestedAddress, devices: [])
    }

    static func makeEmptyDefault() -> AtmInfo {
        return self.makeDefault(city: "", address: "")
    }

    static func create(with data: Data?) -> AtmInfo  {
        guard let data = data else {
            return AtmInfo.makeEmptyDefault()
        }

        do {
            let object = try JSONDecoder().decode(AtmInfo.self, from: data)
            return object
        } catch {
            print("Decode AtmInfo failed")
            return AtmInfo.makeEmptyDefault()
        }
    }

}

// MARK: -

extension AtmInfo.Device {
    static func create(with data: Data) throws -> AtmInfo.Device  {
        return try JSONDecoder().decode(AtmInfo.Device.self, from: data)
    }

    static func create(with data: Data) throws -> [AtmInfo.Device]  {
        return try JSONDecoder().decode([AtmInfo.Device].self, from: data)
    }
}


// MARK: -

extension AtmInfo.Device.Tw {
    static func create(with data: Data) throws -> AtmInfo.Device.Tw  {
        return try JSONDecoder().decode(AtmInfo.Device.Tw.self, from: data)
    }

    static func create(with data: Data) throws -> [AtmInfo.Device.Tw]  {
        return try JSONDecoder().decode([AtmInfo.Device.Tw].self, from: data)
    }
}