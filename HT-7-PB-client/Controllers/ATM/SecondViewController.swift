//
//  SecondViewController.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/27/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //    MARK - private properties
    @IBOutlet weak var tableView: UITableView!
    private lazy var dataSource = AtmViewDelegate(tableView: self.tableView)
    private lazy var atmService: AtmService = AtmServiceImpl()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        fetchData()
    }
    
    private func fetchData() {
        let data = atmService.getAtm(city: "", address: "")
        print(data)
        dataSource.reload(with: data)

    }


}

