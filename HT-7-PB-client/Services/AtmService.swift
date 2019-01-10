//
// Created by Eugene on 1/7/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import Foundation

protocol AtmService {
    func getAtm(city: City, address: Address, onReceiveAction: @escaping ((Model) -> ()))
}

class AtmServiceImpl: AtmService {
    private let pbApi: PbApi

    init() {
        pbApi = PbApi()
    }

    func getAtm(city: City, address: Address, onReceiveAction: @escaping ((Model) -> ())) {
        pbApi.getAtmInfo(cityName: city, address: address, onReceiveAction: onReceiveAction)
    }
}
