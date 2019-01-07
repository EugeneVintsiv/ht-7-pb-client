//
//  AtmAddressViewCell.swift
//  HT-7-PB-client
//
//  Created by Eugene on 1/7/19.
//  Copyright © 2019 Eugene. All rights reserved.
//

import UIKit

class AtmAddressViewCell: UITableViewCell {
    static let reuseIdentifier = "atmAddressViewCell"

    @IBOutlet weak var cityInfo: UILabel!
    @IBOutlet weak var placeInfo: UILabel!
    @IBOutlet weak var addressInfo: UILabel!
    
    func setup(with model: AtmInfo.Device) {
        cityInfo.text = model.cityUA
        placeInfo.text = definePlaceInfo(model)
        addressInfo.text = model.fullAddressUa

        addressInfo.numberOfLines = 3
        addressInfo.sizeToFit()
        addressInfo.adjustsFontSizeToFitWidth = true
    }

    private func definePlaceInfo(_ model: AtmInfo.Device) -> String {
        if "Отделение банка" == model.placeRu || "install" == model.placeUa {
            return "Вiддiлення банку"
        }

        if model.placeUa != nil {
            return model.placeUa!
        }
        
        return "Вiддiлення банку"
    }

}
