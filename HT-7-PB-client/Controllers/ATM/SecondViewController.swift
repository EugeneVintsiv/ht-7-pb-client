//
//  SecondViewController.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/27/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var citiesTextField: UITextField!
    let citiesPicker = UIPickerView()

    @IBAction func refreshButton(_ sender: Any) {
        fetchData()
    }


    private lazy var dataSource = AtmViewDelegate(tableView: self.tableView)
    private lazy var atmService: AtmService = AtmServiceImpl()
    private lazy var pickerDataSource: PickerDataSouurce = PickerDataSouurce(citiesTextField: self.citiesTextField)

    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTextField.inputView = citiesPicker
        citiesPicker.delegate = pickerDataSource
        citiesPicker.dataSource = pickerDataSource

        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        fetchData()
    }

    private func fetchData() {
        if citiesTextField?.text != "" {
            atmService.getAtm(city: citiesTextField.text, address: "Го") { (atmInfo) in
                self.dataSource.reload(with: atmInfo)
            }
        }

    }


}

