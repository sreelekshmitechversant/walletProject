//
//  WalletHistoryViewController.swift
//  WalletDesign
//
//  Created by Anjali CD on 10/11/23.
//

import UIKit

class WalletHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var walletTransactionHistoryBackButton: UIButton!
    @IBOutlet weak var walletTableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    let cellHeight: CGFloat = 80
    let cellSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.walletTableView.register(UINib(nibName: "WalletTableViewCell", bundle: nil), forCellReuseIdentifier: "WalletTableViewCell")
        walletTableView.delegate = self
        walletTableView.dataSource = self
        walletTableView.backgroundColor = UIColor.clear
        topView.layer.cornerRadius = 35
        walletTableView.separatorStyle = .none
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell",for: indexPath) as? WalletTableViewCell
        cell?.view.layer.cornerRadius = 10
        cell?.view.applyShadow()
        cell?.selectionStyle = .none
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight + cellSpacing
        
    }
    
}
