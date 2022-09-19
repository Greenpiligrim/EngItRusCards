//
//  TestView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 19/09/22.
//

import SwiftUI
import Foundation

struct TestView: View {
    let people = EnglishFrasesDataServise.FrasesCard

    var body: some View {
        ZStack {
            ForEach(people) { p in
                CardView(cardData: p)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


struct CardView: View {
    var cardData: Frases
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 400)
                .cornerRadius(30)
                .shadow(radius: 5)
            
            
            HStack {
                Text(cardData.it)
                    .font(.largeTitle)
                    .foregroundColor(.white)
           
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
        DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
                withAnimation {
                    changeColor(width: offset.width)
                }
            }
            .onEnded { _ in
                withAnimation {
                    swipeCard(width: offset.width)
                    changeColor(width: offset.width)
                }
            }
        )
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("\(cardData) removed")
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(cardData) added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...150:
            color = .green
        default:
            color = .black
        }
    }

}
