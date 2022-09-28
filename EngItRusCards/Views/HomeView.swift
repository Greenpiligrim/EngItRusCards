//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: []) var cards: FetchedResults<Cards>
    @EnvironmentObject var vm: FrasesViewModel
    @State var showSheet: Bool = false
    
    @State var testBool: Bool = true
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            if testBool {
                VStack {
                    List(cards) { card in
                        Text(card.rus ?? "No data rus")
                        Text(card.eng ?? "No data eng")
                        Text(card.it ?? "No data it")
                        Text(card.rusIt ?? "No data rusIt")
                    }
                }
            } else {
                VStack {
                    editButton
                    CardFrases(frasses: vm.frasesArray)
                }
            }
        }
    }
    
}



extension HomeView {
    private var editButton: some View {
        
        Button {
            showSheet.toggle()
        } label: {
            HStack {
                Image(systemName: "square.and.pencil")
                Text("Edit cards")
            }
            .font(.body)
            .shadow(color: .red, radius: 20)
        }
        .sheet(isPresented: $showSheet) {
            AddView()
        }
    }
}
