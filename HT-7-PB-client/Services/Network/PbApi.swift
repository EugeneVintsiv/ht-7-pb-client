//
//  PbApi.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/28/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation
import UIKit

typealias City = String?
typealias Address = String?

protocol PbNetworkApi {
    func getCurrencies() -> [PbCurrencyInfo]

    func getAtmInfo(cityName city: String?, address: Address) -> AtmInfo
}


class PbApi : PbNetworkApi {
    func getAtmInfo(cityName city: City, address: Address) -> AtmInfo {
        let jsonStr: String = "{\"city\":\"cherkasy\",\"address\":\"Гоголя\",\"devices\":[{\"type\":\"ATM\",\"cityRU\":\"Черкассы\",\"cityUA\":\"Черкаси\",\"cityEN\":\"Cherkasy\",\"fullAddressRu\":\"Украина,область Черкасская,город Черкассы,улица Гоголя,дом 250\",\"fullAddressUa\":\"Украiна,область Черкаська,мiсто Черкаси,вулиця Гоголя,будинок 250\",\"fullAddressEn\":\"Ukraine,area Cherkaska,city Cherkasy,building 250\",\"placeRu\":\"А-банк\",\"placeUa\":\"А-банк\",\"latitude\":\"49.440596\",\"longitude\":\"32.060490\",\"tw\":{\"mon\":\"00:00 - 23:59\",\"tue\":\"00:00 - 23:59\",\"wed\":\"00:00 - 23:59\",\"thu\":\"00:00 - 23:59\",\"fri\":\"00:00 - 23:59\",\"sat\":\"00:00 - 23:59\",\"sun\":\"00:00 - 23:59\",\"hol\":\"00:00 - 23:59\"}},{\"type\":\"ATM\",\"cityRU\":\"Черкассы\",\"cityUA\":\"Черкаси\",\"cityEN\":\"Cherkasy\",\"fullAddressRu\":\"Украина,область Черкасская,город Черкассы,улица Гоголя,дом 274\",\"fullAddressUa\":\"Украiна,область Черкаська,мiсто Черкаси,вулиця Гоголя,будинок 274\",\"fullAddressEn\":\"Ukraine,area Cherkaska,city Cherkasy,building 274\",\"placeRu\":\"универсам \\\"Добробут\\\"\",\"placeUa\":\"унiверсам \\\"Добробут\\\"\",\"latitude\":\"49.438390\",\"longitude\":\"32.064520\",\"tw\":{\"mon\":\"08:00 - 17:00\",\"tue\":\"08:00 - 17:00\",\"wed\":\"08:00 - 17:00\",\"thu\":\"08:00 - 17:00\",\"fri\":\"08:00 - 17:00\",\"sat\":\"08:00 - 17:00\",\"sun\":\"08:00 - 17:00\",\"hol\":\"00:00 - 00:00\"}},{\"type\":\"ATM\",\"cityRU\":\"Черкассы\",\"cityUA\":\"Черкаси\",\"cityEN\":\"Cherkasy\",\"fullAddressRu\":\"Украина,область Черкасская,город Черкассы,улица Гоголя,дом 221\",\"fullAddressUa\":\"Украiна,область Черкаська,мiсто Черкаси,вулиця Гоголя,будинок 221\",\"fullAddressEn\":\"Ukraine,area Cherkaska,city Cherkasy,building 221\",\"placeRu\":\"Отделение банка\",\"placeUa\":\"Вiддiлення банку\",\"latitude\":\"49.444458\",\"longitude\":\"32.054516\",\"tw\":{\"mon\":\"00:00 - 23:59\",\"tue\":\"00:00 - 23:59\",\"wed\":\"00:00 - 23:59\",\"thu\":\"00:00 - 23:59\",\"fri\":\"00:00 - 23:59\",\"sat\":\"00:00 - 23:59\",\"sun\":\"00:00 - 23:59\",\"hol\":\"00:00 - 23:59\"}},{\"type\":\"ATM\",\"cityRU\":\"Черкассы\",\"cityUA\":\"Черкаси\",\"cityEN\":\"Cherkasy\",\"fullAddressRu\":\"Украина,область Черкасская,город Черкассы,улица Гоголя,дом 274\",\"fullAddressUa\":\"Украiна,область Черкаська,мiсто Черкаси,вулиця Гоголя,будинок 274\",\"fullAddressEn\":\"Ukraine,area Cherkaska,city Cherkasy,building 274\",\"placeRu\":\"универсам \\\"Добробут\\\"\",\"placeUa\":\"унiверсам \\\"Добробут\\\"\",\"latitude\":\"49.438390\",\"longitude\":\"32.064520\",\"tw\":{\"mon\":\"08:00 - 17:00\",\"tue\":\"08:00 - 17:00\",\"wed\":\"08:00 - 17:00\",\"thu\":\"08:00 - 17:00\",\"fri\":\"08:00 - 17:00\",\"sat\":\"08:00 - 17:00\",\"sun\":\"08:00 - 17:00\",\"hol\":\"00:00 - 00:00\"}},{\"type\":\"ATM\",\"cityRU\":\"Черкассы\",\"cityUA\":\"Черкаси\",\"cityEN\":\"Cherkasy\",\"fullAddressRu\":\"Украина,область Черкасская,город Черкассы,улица Гоголя,дом 582\",\"fullAddressUa\":\"Украiна,область Черкаська,мiсто Черкаси,вулиця Гоголя,будинок 582\",\"fullAddressEn\":\"Ukraine,area Cherkaska,city Cherkasy,building 582\",\"placeRu\":\"Отделение банка\",\"placeUa\":\"\",\"latitude\":\"49.417167\",\"longitude\":\"32.101948\",\"tw\":{\"mon\":\"00:00 - 23:59\",\"tue\":\"00:00 - 23:59\",\"wed\":\"00:00 - 23:59\",\"thu\":\"00:00 - 23:59\",\"fri\":\"00:00 - 23:59\",\"sat\":\"00:00 - 23:59\",\"sun\":\"00:00 - 23:59\",\"hol\":\"00:00 - 23:59\"}},{\"type\":\"ATM\",\"cityRU\":\"Черкассы\",\"cityUA\":\"Черкаси\",\"cityEN\":\"Cherkasy\",\"fullAddressRu\":\"Украина,область Черкасская,город Черкассы,улица Гоголя,дом 255\",\"fullAddressUa\":\"Украiна,область Черкаська,мiсто Черкаси,вулиця Гоголя,будинок 255\",\"fullAddressEn\":\"Ukraine,area Cherkaska,city Cherkasy,building 255\",\"placeRu\":\"Магазин \\\"Океан\\\"\",\"placeUa\":\"Магазин \\\"Океан\\\"\",\"latitude\":\"49.439780\",\"longitude\":\"32.061950\",\"tw\":{\"mon\":\"09:00 - 18:00\",\"tue\":\"09:00 - 18:00\",\"wed\":\"09:00 - 18:00\",\"thu\":\"09:00 - 18:00\",\"fri\":\"09:00 - 18:00\",\"sat\":\"09:00 - 18:00\",\"sun\":\"09:00 - 18:00\",\"hol\":\"00:00 - 00:00\"}},{\"type\":\"ATM\",\"cityRU\":\"Черкассы\",\"cityUA\":\"Черкаси\",\"cityEN\":\"Cherkasy\",\"fullAddressRu\":\"Украина,область Черкасская,город Черкассы,улица Гоголя,дом 316\",\"fullAddressUa\":\"Украiна,область Черкаська,мiсто Черкаси,вулиця Гоголя,будинок 316\",\"fullAddressEn\":\"Ukraine,area Cherkaska,city Cherkasy,building 316\",\"placeRu\":\"Дом правосудия\",\"placeUa\":\"Будинок правосуддя\",\"latitude\":\"49.434956\",\"longitude\":\"32.070591\",\"tw\":{\"mon\":\"09:00 - 16:00\",\"tue\":\"09:00 - 16:00\",\"wed\":\"09:00 - 16:00\",\"thu\":\"09:00 - 16:00\",\"fri\":\"09:00 - 16:00\",\"sat\":\"09:00 - 16:00\",\"sun\":\"00:00 - 00:00\",\"hol\":\"00:00 - 00:00\"}}]}"
        print(jsonStr)
        let data: Data? = jsonStr.data(using: String.Encoding.utf8)
        print(data!)
        do {
            let result: AtmInfo = try AtmInfo.create(with: data!)
            print(result)
            return result
        } catch {
            print("Error during parse")
            return AtmInfo.makeDefault(city: city, address: address)
        }
    }
    
    func getCurrencies() -> [PbCurrencyInfo] {

        let jsonStr: String = "[{\"ccy\":\"USD\",\"base_ccy\":\"UAH\",\"buy\":\"27.40000\",\"sale\":\"27.70083\"},{\"ccy\":\"EUR\",\"base_ccy\":\"UAH\",\"buy\":\"31.05000\",\"sale\":\"31.64557\"},{\"ccy\":\"RUR\",\"base_ccy\":\"UAH\",\"buy\":\"0.37500\",\"sale\":\"0.40501\"},{\"ccy\":\"BTC\",\"base_ccy\":\"USD\",\"buy\":\"3447.7226\",\"sale\":\"3810.6408\"}]"
        print(jsonStr)
        let t = jsonStr.data(using: String.Encoding.utf8)
        print(t!)
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
