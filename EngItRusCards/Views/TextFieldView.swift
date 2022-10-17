//
//  TextFieldView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 17/10/22.
//

import SwiftUI

struct TextFieldView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var dataFromCore: FetchedResults<Item>
    
    @State var eng: String = ""
    @State var rus: String = ""
    @State var it: String = ""
    @State var rusIt: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TextFieldRow(lang: "eng", langBi: $eng)
            TextFieldRow(lang: "rus", langBi: $rus)
            TextFieldRow(lang: "it", langBi: $it)
            TextFieldRow(lang: "rusIt", langBi: $rusIt)
            
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}

struct TextFieldRow: View {
    let lang: String
    let langBi: Binding<String>
    var body: some View {
        TextField(lang, text: langBi)
            .padding()
            .background(
                Color
                    .white
                    .opacity(0.3)
                    .cornerRadius(10) )
            .font(.headline)
    }
}
