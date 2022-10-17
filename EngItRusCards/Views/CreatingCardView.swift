//
//  CreatingCardView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 17/10/22.
//

import SwiftUI

struct CreatingCardView: View {
    @Environment (\.presentationMode) var presentation
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                Color.orange.opacity(0.2).ignoresSafeArea()
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.orange)
                        .font(.largeTitle)
                        .padding(20)
                }
            }
            TextFieldView()
                .padding(20)
        }
    }
}

struct CreatingCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreatingCardView()
    }
}
