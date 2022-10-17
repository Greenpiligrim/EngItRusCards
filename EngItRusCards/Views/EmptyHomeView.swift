//
//  EmptyHomeView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 17/10/22.
//

import SwiftUI

struct EmptyHomeView: View {
    @State var sheetTogle: Bool = false
    var body: some View {
        
        Button {
            sheetTogle.toggle()

        } label: {
            Text("Push And Create Your First Card")
                .font(.callout)
                .fontWeight(.thin)
                .tint(.black)
                .frame(width: 300, height: 60)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .red, radius: 20)
               
        }
        .sheet(isPresented: $sheetTogle) {
            CreatingCardView()
        }
    }
}

struct EmptyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyHomeView()
    }
}
