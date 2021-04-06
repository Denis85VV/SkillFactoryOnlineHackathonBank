//
//  DepositVC.swift
//  Bank
//
//  Created by Denis Vv on 05.04.2021.
//

import Foundation
import UIKit
import RealmSwift

class DepositVC: UIViewController {
    
    
    @IBOutlet weak var depositAmauntField: UITextField!
    
    @IBAction func depositButtonAction(_ sender: Any) {
        
        let realm = try! Realm()
        let bankModel = BankModel()
        let getBalance = realm.objects(BankModel.self).last?.balance
        let depositAmount = Int(depositAmauntField.text ?? "0")
        
        bankModel.balance = getBalance! + depositAmount!
        
        guard realm.objects(BankModel.self).last != nil else { return }
        
        try! realm.write {
            realm.add(bankModel)
        }
    }
}
