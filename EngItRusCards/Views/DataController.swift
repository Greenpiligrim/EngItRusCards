//
//  DataController.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 28/09/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data faild to load \(error.localizedDescription)")
            }
        }
    }
}
