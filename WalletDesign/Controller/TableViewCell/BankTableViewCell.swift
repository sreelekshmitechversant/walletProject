//
//  BankTableViewCell.swift
//  WalletDesign
//
//  Created by Admin on 10/11/23.
//

import UIKit



class BankTableViewCell: UITableViewCell {
   
    @IBOutlet weak var bankNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
