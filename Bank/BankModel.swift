//
//  BankModel.swift
//  Bank
//
//  Created by Denis Vv on 04.04.2021.
//

import Foundation
import RealmSwift
import Realm

class BankModel: Object {
    @objc dynamic var balance = 0
}
