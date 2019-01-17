//
// Created by Eugene on 1/17/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import UIKit

class PickerDataSouurce: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

    let cities = [
        "cherkasy",
        "Kyiv",
        "Lviv",
        "Черкаси"
    ]
    let citiesTextField: UITextField!
    init(citiesTextField: UITextField) {
        self.citiesTextField = citiesTextField
    }
    // MARK: UIPickerView Delegation

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        citiesTextField.text = cities[row]
        citiesTextField.resignFirstResponder()
    }
}