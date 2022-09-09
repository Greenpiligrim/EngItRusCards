//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI

struct FrasesView: View {
    @EnvironmentObject var vm: FrasesViewModel

    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            CardFrases(frasses: vm.frasesArray)
          
        }
    }
    
}
