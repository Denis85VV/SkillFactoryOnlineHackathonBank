//
//  BalanceVC.swift
//  Bank
//
//  Created by Denis Vv on 03.04.2021.
//

import UIKit
import RealmSwift

class BalanceVC: UIViewController {
    
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        print(realm.configuration.fileURL!)
        
        let showBalance = realm.objects(BankModel.self).last?.balance
        
        balance.text = "$ \(Int(showBalance ?? 0))"
    }
}
