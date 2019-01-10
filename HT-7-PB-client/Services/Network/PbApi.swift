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
    func getCurrencies(onReceiveAction: @escaping (([Model]) -> ()))

    func getAtmInfo(cityName city: String?, address: Address, onReceiveAction: @escaping ((Model) -> ()))
}


class PbApi : PbNetworkApi {

    // MARK: Private properties

    private let ATM_URL = "https://api.privatbank.ua/p24api/infrastructure"
    private let CURRENCY_URL = "https://api.privatbank.ua/p24api/pubinfo"

    func getAtmInfo(cityName city: City, address: Address, onReceiveAction: @escaping ((Model) -> ())) {
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?

        guard var urlComponents = URLComponents(string: ATM_URL) else {
            fatalError("Incorrect url string")
        }
        urlComponents.queryItems = [.init(name: "json", value: ""),
                                    .init(name: "atm", value: ""),
                                    .init(name: "address", value: address),
                                    .init(name: "city", value: city)]

        dataTask = defaultSession.dataTask(with: urlComponents.url!) { data, response, error in
            var model: Model = AtmInfo.makeEmptyDefault()

            defer { DispatchQueue.main.async { onReceiveAction(model) } }
            defer { dataTask = nil }

            guard error == nil && (response as? HTTPURLResponse)?.statusCode == 200 else {
                let errorData = NetworkError(message: error?.localizedDescription ?? "Error occurred while fetching data")
                model = errorData
                return
            }
            model = AtmInfo.create(with: data)
        }
        dataTask?.resume()
    }

    func getCurrencies(onReceiveAction: @escaping (([Model]) -> ())) {
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?

        guard var urlComponents = URLComponents(string: CURRENCY_URL) else {
            fatalError("Incorrect url string")
        }

        urlComponents.queryItems = [.init(name: "exchange", value: ""),
                                    .init(name: "json", value: ""),
                                    .init(name: "coursid", value: "11")]

        dataTask = defaultSession.dataTask(with: urlComponents.url!) { data, response, error in
            var models: [Model] = []

            defer { DispatchQueue.main.async { onReceiveAction(models) } }
            defer { dataTask = nil }

            guard error == nil && (response as? HTTPURLResponse)?.statusCode == 200 else {
                let errorData = NetworkError(message: error?.localizedDescription ?? "Error occurred while fetching data")
                models.append(errorData)
                return
            }
            models.append(contentsOf: PbCurrencyInfo.create(with: data))
        }
        dataTask?.resume()
    }

}
