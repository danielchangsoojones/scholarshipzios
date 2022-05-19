//
//  SettingsViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit
import Former
import SCLAlertView

class HomeMenuViewController: BaseFormViewController<Any> {
    let becomeADriverRow = LabelRowFormer<FormLabelCell>()
    let reportDriverRow = LabelRowFormer<FormLabelCell>()
    
    var messageHelper: MessageHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        setContactUsRow()
        setupBecomeADriverRow()
        //giving it a big inset from the bottom because sometimes the nav bar
        //gets too big and then it covers the logout button. It's a hacky fix
        //that works for now.
        tableView.contentInset.bottom = 100
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    private func setContactUsRow() {
        self.addTappableLabelRow(title: "Contact Us") {
            self.textCustomerService()
        }
    }
    
    private func setupBecomeADriverRow() {
        addRowWithFooter(row: becomeADriverRow,
                         header: "Join Our Platform as an Athlete",
                         footer: "Are you interested in joining our platform to start your own store? Message us")
    }
    
    private func addRowWithFooter(row: LabelRowFormer<FormLabelCell>, header: String, footer: String) {
        messageHelper = MessageHelper(currentVC: self)
        
        row.configure { (row) in
            row.text = "Tap here"
        }
        
        row.onSelected { (_) in
            let body = "Hi, I'm interested in starting my own storefront as an athlete"
            self.textCustomerService(body: body)
        }
        
        append(row: row, headerTitle: header, footerDescription: footer)
    }
    
    private func textCustomerService(body: String? = nil) {
        let customerServicePhone = "3176905323"
        messageHelper?.text(customerServicePhone)
    }
}

