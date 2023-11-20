//
//  EmployeeDetailViewController.swift
//  WalletDesign
//
//  Created by Anjali CD on 10/11/23.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    
    @IBOutlet weak var EpinView: UIView!
    @IBOutlet weak var employementStatusView: UIView!
    @IBOutlet weak var designationView: UIView!
    @IBOutlet weak var departmentView: UIView!
    @IBOutlet weak var durationView: UIView!
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var regionView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EpinView.applyShadow()
        employementStatusView.applyShadow()
        designationView.applyShadow()
        departmentView.applyShadow()
        durationView.applyShadow()
        stateView.applyShadow()
        regionView.applyShadow()
        statusView.applyShadow()
        EpinView.layer.cornerRadius = 10
        employementStatusView.layer.cornerRadius = 10
        designationView.layer.cornerRadius = 10
        departmentView.layer.cornerRadius = 10
        durationView.layer.cornerRadius = 10
        stateView.layer.cornerRadius = 10
        regionView.layer.cornerRadius = 10
        statusView.layer.cornerRadius = 10
        topView.layer.cornerRadius = 35
        profileImage.makeRound()
    }
    
}
