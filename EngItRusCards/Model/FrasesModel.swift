//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import Foundation


struct Frases: Identifiable, Equatable {
    
    var id: String {
        eng
    }
    let eng: String
    let rus: String
    
    
    //MARK: - Italian
    let it: String
    let rusIt: String
    
    //i'm not sure about this func mabe will be need
    static func == (lhs: Frases, rhs: Frases) -> Bool {
        lhs.id == rhs.id
    }
}
