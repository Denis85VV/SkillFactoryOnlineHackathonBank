//
//  BalanceVC.swift
//  Bank
//
//  Created by Denis Vv on 03.04.2021.
//

import UIKit
import RealmSwift
import Realm

class BalanceVC: UIViewController {


    
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let realm = try! Realm()
        let myBalance = 54
        
        print(realm.configuration.fileURL)
        
        let showBalance = realm.objects(BankModel.self).last?.balance
        print(showBalance ?? "Opps")
        
        var bankModel = BankModel()
        bankModel.balance = .init(112 + .random(in: 1..<100))
        
        guard let objectsToDelete = realm.objects(BankModel.self).first else { return }
        
        try! realm.write {
            realm.add(bankModel)
            realm.delete(objectsToDelete)
        }
        
        balance.text = "$ \(Int(showBalance ?? 0))"
    }
}
