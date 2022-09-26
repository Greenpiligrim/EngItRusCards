//
//  AddView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 26/09/22.
//

import SwiftUI

struct AddView: View {
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.app")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
