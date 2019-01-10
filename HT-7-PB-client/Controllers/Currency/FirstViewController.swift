//
//  FirstViewController.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/27/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    //    MARK - private properties
    @IBOutlet weak var tableView: UITableView!

    private lazy var currencyService: CurrencyService = CurrencyServiceImpl()
    // MARK: Delegate

    private lazy var dataSource = CurrencyViewDelegate(tableView: self.tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        fetchData()
    }

    private func fetchData() {
        currencyService.getCurrencies( onReceiveAction: { (currencies) in
            print(currencies)
            self.dataSource.reload(with: currencies)
        })

    }

}

