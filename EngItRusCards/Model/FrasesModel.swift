//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import Foundation


struct Frases: Identifiable, Equatable {
    
//    var id = UUID().uuidString
    let id: String
    let eng: String
    let rus: String
    
    
    //MARK: - Italian
    let it: String
    let rusIt: String
    
    //i'm not sure about this func mabe will be need
    static func == (lhs: Frases, rhs: Frases) -> Bool {
        lhs.id == rhs.id
    }
    
   //MARK: - CoreData modul
    
    init(id: String = UUID().uuidString, eng: String, rus: String, it: String, rusIt: String) {
        self.id = id
        self.eng = eng
        self.rus = rus
        self.it = it
        self.rusIt = rusIt
    }
    
    func updateCompletion() -> Frases {
        return Frases(eng: eng, rus: rus, it: it, rusIt: rusIt)
    }
//    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
//        self.id = id
//        self.title = title
//        self.isCompleted = isCompleted
//
//    }
//
//    func apdateCompletion() -> ItemModel {
//        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
//
//    }
    
}
