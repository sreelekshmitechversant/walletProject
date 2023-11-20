//
//  WalletTableViewCell.swift
//  WalletDesign
//
//  Created by Anjali CD on 15/11/23.
//

import UIKit

class WalletTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var upiLabel: UILabel!
    @IBOutlet weak var topUpLabel: UILabel!
    
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
