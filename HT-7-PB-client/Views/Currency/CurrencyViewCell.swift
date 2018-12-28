//
//  TableViewCell.swift
//  HT-7-PB-client
//
//  Created by Eugene on 12/28/18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class CurrencyViewCell: UITableViewCell {
    static let reuseIdentifier = "currencyViewCell"

    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var buyRate: UILabel!
    @IBOutlet weak var sellRate: UILabel!
    
    func setup(with info: PbCurrencyInfo) {
        from.text = info.baseCcy
        to.text = info.ccy
        buyRate.text = info.buy
        sellRate.text = info.sale
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
}
