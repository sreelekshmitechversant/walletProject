//
//  AccountViewController.swift
//  WalletDesign
//
//  Created by Admin on 17/11/23.
//

import UIKit

class AccountViewController: UIViewController {
    
    
    @IBOutlet weak var nextOfKinViewButton: UIButton!
    @IBOutlet weak var statementViewButton: UIButton!
    @IBOutlet weak var accountImageView: UIView!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var gratuityView: UIView!
    @IBOutlet weak var currentMonthTransactionView: UIView!
    @IBOutlet weak var statementView: UIView!
    @IBOutlet weak var pensionLabel: UILabel!
    @IBOutlet weak var nextOfKinView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextOfKinView.addBorder(width: 1, color: UIColor.systemGray4)
        statementView.addBorder(width: 1, color: UIColor.systemGray4)
        gratuityView.applyCornerRadius(10)
        gratuityView.applyShadow()
        currentMonthTransactionView.applyCornerRadius(10)
        currentMonthTransactionView.applyShadow()
        gratuityView.addBorder(width: 1, color: UIColor.systemGray4)
        currentMonthTransactionView.addBorder(width: 1, color: UIColor.systemGray4)
        pensionLabel.textColor = UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        completedLabel.textColor = UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        accountImageView.backgroundColor =
            UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func statementButtonTapped(_ sender: Any) {
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "CurrentAccountBalanceViewController") {
                   navigationController?.pushViewController(nextViewController, animated: true)
               }
    }
    @IBAction func nextofKinBottonTapped(_ sender: Any) {
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "KinOfProfileViewController") {
                   navigationController?.pushViewController(nextViewController, animated: true)
               }    }
}

