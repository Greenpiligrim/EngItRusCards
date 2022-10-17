//
//  Item+helper.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 17/10/22.
//

import Foundation
import CoreData

extension Item {
    convenience init(eng: String, rus: String, it: String, rusIt: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.eng_ = eng
        self.rus_ = rus
        self.it_ = it
        self.rusIt_ = rusIt
        
    }
    var eng: String {
        get {
           eng_ ?? ""
        }
        set {
            eng_ = newValue
        }
    }
    
    var rus: String {
        get {
           rus_ ?? ""
        }
        set {
            rus_ = newValue
        }
    }
    var it: String {
        get {
           it_ ?? ""
        }
        set {
            it_ = newValue
        }
    }
    var rusIt: String {
        get {
           rusIt_ ?? ""
        }
        set {
            rusIt_ = newValue
        }
    }
}
