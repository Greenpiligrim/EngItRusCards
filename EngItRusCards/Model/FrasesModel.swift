//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import Foundation
import CoreData
import SwiftUI


struct Frases: Identifiable, Equatable {
    
    var id = UUID().uuidString
    let eng: String
    let rus: String
    
    
    //MARK: - Italian
    let it: String
    let rusIt: String
    
    static func == (lhs: Frases, rhs: Frases) -> Bool {
        lhs.id == rhs.id
    }
    

}

