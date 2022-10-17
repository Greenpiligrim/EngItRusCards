//
//  PersistController.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 17/10/22.
//


import Foundation
import CoreData
import SwiftUI

class PersistController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataModel")
   
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Data Core: \(error.localizedDescription)")
            }
        }
        
    }
    
  
    
}
