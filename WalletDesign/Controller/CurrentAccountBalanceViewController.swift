//
//  CurrentAccountBalanceViewController.swift
//  WalletDesign
//
//  Created by Admin on 17/11/23.
//

import UIKit
import PDFKit
import WebKit

class CurrentAccountBalanceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var date:[String] = ["15/02/2022","1/7/2023","12/7/2023","12/4/2023"]
    var upi:[String] = ["UPI/123564789652369/@chidi","UPI/123564789652369/@chidi","UPI/123564789652369/@chidi","UPI/123564789652369/@chidi"]
    
    var amountMode:[String] = ["Pension Received","Widthdrawal through bank ATM","Widthdrawal through bank ATM","Pension Received"]
    var amount:[String] = ["N1200","-N150","-N100","N1500"]
    var credit:[String] = ["Credit","Credit","Credit","Credit"]

    @IBOutlet weak var currentAccountBalanceView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var CurrentAccountTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CurrentAccountTableView.register(UINib(nibName: "WalletTableViewCell", bundle: nil), forCellReuseIdentifier: "WalletTableViewCell")
        CurrentAccountTableView.delegate = self
        CurrentAccountTableView.dataSource = self
        CurrentAccountTableView.separatorStyle = .none
        buttonView.backgroundColor = UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        currentAccountBalanceView.backgroundColor =
            UIColor(displayP3Red: 1/255, green: 134/255, blue: 82/255, alpha: 1.0)
        buttonView.applyCornerRadius(10)
    }
    @IBAction func statementButton(_ sender: Any) {
        
        captureScreenshotAndSaveAsPDF()
       // saveAndOpenPDF()
    }
  /*  func saveAndOpenPDF() {
            let pdfData = createPDFData()

            if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let pdfPath = documentsPath.appendingPathComponent("123")

                do {
                    try pdfData.write(to: pdfPath)
                    print("PDF saved to: \(pdfPath)")

                    openPDF(withURL: pdfPath)
                } catch {
                    print("Error saving PDF: \(error.localizedDescription)")
                }
            }
        }
    func createPDFData() -> Data {
        var pdfData = Data()

        DispatchQueue.main.async {
            if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let pdfPath = documentsPath.appendingPathComponent("WalletDesign.pdf")

                UIGraphicsBeginPDFContextToFile(pdfPath.path, CGRect.zero, nil)

                guard let pdfContext = UIGraphicsGetCurrentContext() else {
                    print("Error creating PDF context")
                    return
                }

                UIGraphicsBeginPDFPage()

                // Manually draw the view's layer into the PDF context
                if let currentView = self.view {
                    currentView.layer.render(in: pdfContext)
                }

                UIGraphicsEndPDFContext()

                do {
                    pdfData = try Data(contentsOf: pdfPath)
                    print("PDF created successfully: \(pdfPath)")
                } catch {
                    print("Error reading PDF data: \(error.localizedDescription)")
                }
            }
        }

        return pdfData
    }

        func openPDF(withURL url: URL) {
            let webView = UIWebView(frame: self.view.frame)
            webView.loadRequest(URLRequest(url: url))
            self.view.addSubview(webView)
        }*/
    
    func captureScreenshotAndSaveAsPDF() {
           UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, false, 0.0)
           self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
           
           guard let screenshotImage = UIGraphicsGetImageFromCurrentImageContext() else {
               print("Error capturing screenshot")
               UIGraphicsEndImageContext()
               return
           }
           
           UIGraphicsEndImageContext()
           
           if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
               let pdfPath = documentsPath.appendingPathComponent("screenshot.pdf")
               
               UIGraphicsBeginPDFContextToFile(pdfPath.path, CGRect.zero, nil)
               UIGraphicsBeginPDFPage()
               
               guard let pdfContext = UIGraphicsGetCurrentContext() else {
                   print("Error creating PDF context")
                   return
               }
               
               // Correctly handle orientation
               pdfContext.translateBy(x: 0.0, y: screenshotImage.size.height)
               pdfContext.scaleBy(x: 1.0, y: -1.0)
               
               pdfContext.draw(screenshotImage.cgImage!, in: CGRect(origin: .zero, size: screenshotImage.size))
               
               UIGraphicsEndPDFContext()
               
               print("PDF saved to: \(pdfPath)")
               openPDF(withURL: pdfPath)
           }
       }

       func openPDF(withURL url: URL) {
           let webView = UIWebView(frame: self.view.frame)
           webView.loadRequest(URLRequest(url: url))
           self.view.addSubview(webView)
       }
    @IBAction func CurrentBalanceBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell",for: indexPath) as? WalletTableViewCell
        cell?.dateLabel.text = date[indexPath.row]
        cell?.upiLabel.text = upi[indexPath.row]
        cell?.topUpLabel.text = amountMode[indexPath.row]
        cell?.amountLabel.text = amount[indexPath.row]
        cell?.creditLabel.text = credit[indexPath.row]
        if indexPath.item == 1 {
            cell?.amountLabel.textColor = UIColor.red
        }
        else if indexPath.item == 2{
            cell?.amountLabel.textColor = UIColor.red
            
        }
        cell?.view.layer.cornerRadius = 10
        cell?.view.applyShadow()
        cell?.selectionStyle = .none
        return cell!
    }
   }
