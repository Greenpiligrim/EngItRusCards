//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cards: FetchedResults<Cards>
    @EnvironmentObject var vm: FrasesViewModel
    @State var showSheet: Bool = false
    
    @State var testBool: Bool = true
    @State var textField: String = ""
    
    
    func castomArray(fetchedResult: FetchedResults<Cards>) -> [Frases] {
       return fetchedResult.map({Frases(eng: $0.eng ?? "", rus: $0.rus ?? "", it: $0.it ?? "", rusIt: $0.rusIt ?? "")})
    }
    
    
    
    
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            if testBool {
                VStack {
                    TextField("text here", text: $textField)
                    List(cards) { card in
                        Text(card.rus ?? "No data rus")
                        Text(card.eng ?? "No data eng")
                        Text(card.it ?? "No data it")
                        Text(card.rusIt ?? "No data rusIt")
                    }
                    Button {
                        let coreDate = Cards(context: moc)
                        coreDate.id = UUID()
                        coreDate.rusIt = "Привет"
                        coreDate.it = "Ciao"
                        coreDate.rus = "Здрасьте"
                        coreDate.eng = textField
                        try? moc.save()
                    } label: {
                        Image(systemName: "square.and.arrow.up.circle.fill")
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
