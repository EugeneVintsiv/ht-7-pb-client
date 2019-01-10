//
// Created by Eugene on 12/28/18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import UIKit

class CurrencyViewDelegate: NSObject {

    private var tableView: UITableView!
    private var models: [PbCurrencyInfo] = []

    // MARK: Init

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        registerCells()
    }

    // MARK: Public methods

    func reload(with models: [Model]) {

        if (models[0] is NetworkError) {
            showErrorLabel(message: (models[0] as! NetworkError).message)
            self.models = []
            tableView.reloadData()
            return
        }

        self.models = models as! [PbCurrencyInfo]
        tableView.backgroundView = nil
        tableView.reloadData()
    }

    // MARK: Private methods

    private func registerCells() {
        tableView.register(.init(nibName: "CurrencyViewCell", bundle: nil), forCellReuseIdentifier: CurrencyViewCell.reuseIdentifier)
    }

    private func showErrorLabel(message: String) {
        let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        noDataLabel.text = message
        noDataLabel.textColor = .black
        noDataLabel.textAlignment = .center
        tableView.backgroundView = noDataLabel
        tableView.separatorStyle = .none
    }

}

// MARK: Init

extension CurrencyViewDelegate: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models.count {
        case 0:
            showErrorLabel(message: "No data")
            return 0
        default:
            return models.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyViewCell.reuseIdentifier) as! CurrencyViewCell
        cell.setup(with: model)
        return cell
    }
}

// MARK: UITableViewDelegate

extension CurrencyViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


