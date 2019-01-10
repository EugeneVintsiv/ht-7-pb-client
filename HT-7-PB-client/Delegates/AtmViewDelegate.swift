//
// Created by Eugene on 1/7/19.
// Copyright (c) 2019 Eugene. All rights reserved.
//

import UIKit

class AtmViewDelegate: NSObject {

    private var tableView: UITableView!
    private var model: AtmInfo = AtmInfo.makeEmptyDefault()

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        registerCells()
    }

    private func registerCells() {
        tableView.register(.init(nibName: "AtmAddressViewCell", bundle: nil), forCellReuseIdentifier: AtmAddressViewCell.reuseIdentifier)
    }

    // MARK: Public methods

    func reload(with model: Model) {
        switch model.self {
        case is NetworkError:
            showErrorLabel(message: (model as! NetworkError).message)
        default:
            self.model = model as! AtmInfo
            tableView.reloadData()
        }
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

// MARK: DataSource

extension AtmViewDelegate : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch model.devices?.count {
        case 0:
            print("No atm devices")
            showErrorLabel(message: "No data")
            return 0
        default:
            return model.devices?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let device = model.devices?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: AtmAddressViewCell.reuseIdentifier) as! AtmAddressViewCell
        if (device != nil) {
            cell.setup(with: device!)
        }
        return cell

    }
    
}

// MARK: UITableViewDelegate

extension AtmViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
