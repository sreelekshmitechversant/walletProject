//
//  KinOfProfileViewController.swift
//  WalletDesign
//
//  Created by Admin on 17/11/23.
//

import UIKit

class KinOfProfileViewController: UIViewController {
    
    
    @IBOutlet weak var kinofProfileImage: UIView!
    @IBOutlet weak var mailIDView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var phoneView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailIDView.addBorder(width: 1, color:UIColor.systemGray4)
        mailIDView.applyShadow()
        
        addressView.addBorder(width: 1, color:UIColor.systemGray4)
        addressView.applyShadow()
        
        phoneView.addBorder(width: 1, color:UIColor.systemGray4)
        phoneView.applyShadow()
        
        mailIDView.applyCornerRadius(10)
        addressView.applyCornerRadius(10)
        phoneView.applyCornerRadius(10)
        kinofProfileImage.backgroundColor =
            UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
    }
    
    @IBAction func nextofKinBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)    }
}
