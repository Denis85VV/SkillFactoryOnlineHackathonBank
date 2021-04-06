//
//  ViewController.swift
//  Bank
//
//  Created by Denis Vv on 31.03.2021.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController {

    @IBAction func removePrevBalance(_ sender: Any) {
        
        let realm = try! Realm()
        let object = realm.objects(BankModel.self)
        
        try! realm.write {
            realm.delete(object.first!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
