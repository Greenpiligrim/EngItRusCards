//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI

struct FrasesView: View {
    @EnvironmentObject var vm: FrasesViewModel
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                editButton
                CardFrases(frasses: vm.frasesArray)
            }
        }
    }
    
}



extension FrasesView {
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
