//
//  WithdrawalVC.swift
//  Bank
//
//  Created by Denis Vv on 06.04.2021.
//

import Foundation
import RealmSwift

class WithdrawalVC: UIViewController {
    
    @IBOutlet weak var withdrawalAmauntField: UITextField!
    
    @IBAction func withdrawalAmountAction(_ sender: Any) {
        let realm = try! Realm()
        let bankModel = BankModel()
        let getBalance = realm.objects(BankModel.self).last?.balance
        let withdrawalAmount = Int(withdrawalAmauntField.text ?? "0")
        
        bankModel.balance = getBalance! - withdrawalAmount!
        
        guard realm.objects(BankModel.self).last != nil else { return }
        
        try! realm.write {
            realm.add(bankModel)
        }
    }
}
