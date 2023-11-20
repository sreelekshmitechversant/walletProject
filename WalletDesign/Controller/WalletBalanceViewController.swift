//
//  WalletBalanceViewController.swift
//  WalletDesign
//
//  Created by Admin on 10/11/23.
//

import UIKit

class WalletBalanceViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var bankView: UIView!
    @IBOutlet weak var bankSelectTextField: UITextField!
    @IBOutlet weak var bankTableView: UITableView!
    @IBOutlet weak var topWalletView: UIView!
    @IBOutlet weak var TopUpWalletButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var EnterAmountView: UIView!
    @IBOutlet weak var selectYourBankView: UIView!
    @IBOutlet weak var walletHistoryView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    var isToggled = false
    var bankName: [String] =
        ["Zenith Bank","HDFC Bank","South Indian Bank","Canara Bank"]
    override func viewDidLoad() {
        super.viewDidLoad()
        EnterAmountView.addBorder(width: 1, color: UIColor.systemGray4)
        selectYourBankView.addBorder(width: 1, color: UIColor.systemGray4)
        walletHistoryView.addBorder(width: 1, color: UIColor.systemGray4)
        TopUpWalletButton.backgroundColor = UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        topWalletView.backgroundColor = UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        backButton.backgroundColor = UIColor(displayP3Red: 226/255, green: 255/255, blue: 239/255, alpha: 1.0)
        topWalletView.layer.cornerRadius = 10
        backButton.layer.cornerRadius = 10
        bankTableView.delegate = self
        bankTableView.dataSource = self
        bankView.isHidden = true
    }
    @IBAction func checkButtonClicked(_ sender: Any) {
        checkButton.isSelected = !checkButton.isSelected
        
        if checkButton.isSelected {
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            checkButton.tintColor = UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        } else {
            checkButton.setImage(UIImage(systemName: "square"), for: .normal)
            checkButton.tintColor = UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        }
    }
    @IBAction func selectBankButtonClicked(_ sender: Any) {
        isToggled.toggle()
        
        if isToggled {
            bankView.isHidden = false
            
        } else {
            bankView.isHidden = true
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bankName.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? BankTableViewCell
        cell?.bankNameLabel.text = bankName[indexPath.row]
        cell?.selectionStyle = .none
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = bankTableView.cellForRow(at: indexPath) as! BankTableViewCell
        let labelText = cell.bankNameLabel.text
        bankSelectTextField.text = labelText
        bankView.isHidden = true
    }
}
