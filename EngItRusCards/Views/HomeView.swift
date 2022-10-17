//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var newWordfromCore: FetchedResults<Item>
    @EnvironmentObject var vm: FrasesViewModel
    @State var showSheet: Bool = false
    

    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
                VStack {
                    CardFrases(frasses: vm.frasesArray)
            }
        }
    }
    
}




