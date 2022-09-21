//
//  TestView.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 19/09/22.
//

//import SwiftUI
//import Foundation
//
//struct TestView: View {
//    let dataCard = EnglishFrasesDataServise.FrasesCard
//    @State var italian: Bool = false
//    @State var wiseWersa: Bool = false
//
//    var body: some View {
//        ZStack {
//            Color.orange.ignoresSafeArea()
//            ForEach(dataCard) { cardData in
//                CardView(cardData: cardData, wiseWersa: $wiseWersa, italian: $italian)
//            }
//        }
//    }
//}
//
//
//
//
//
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
//
//
//
//
//
//struct CardView: View {
//    let cardData: Frases
//    @State private var offset = CGSize.zero
//    @State private var color: Color = .black
//    
//    @Binding var wiseWersa: Bool//*
//    @Binding var italian: Bool//*
//    @State var showTranslate: Bool = false
//
//    
//    
//    var body: some View {
//
//                VStack {
//                    ArrowFlag(wiseWersa: $wiseWersa, italian: $italian)
//                    bigText
//                    littleText
//                
//                }
//                .frame(width: 300, height: 400)
//                .background()
//                .cornerRadius(30)
//                .shadow(color: .red, radius: offset != .zero ? 5 : 0.5)
//                .offset(x: offset.width, y: offset.height * 0.4)
//                .rotationEffect(.degrees(Double(offset.width / 40)))
//                .gesture(
//                    DragGesture()
//                        .onChanged { gesture in
//                            offset = gesture.translation
//                            withAnimation {
//                                changeColor(width: offset.width)
//                            }
//                        }
//                        .onEnded { _ in
//                            withAnimation {
//                                swipeCard(width: offset.width)
//                                changeColor(width: offset.width)
//                            }
//                        }
//                )
//    }
//    
//    func swipeCard(width: CGFloat) {
//        switch width {
//        case -500...(-150):
//            print("\(cardData) removed")
//            offset = CGSize(width: -500, height: 0)
//        case 150...500:
//            print("\(cardData) added")
//            offset = CGSize(width: 500, height: 0)
//        default:
//            offset = .zero
//        }
//    }
//    
//    func changeColor(width: CGFloat) {
//        switch width {
//        case -500...(-130):
//            color = .red
//        case 130...150:
//            color = .green
//        default:
//            color = .black
//        }
//    }
//    
//}
//
//
//extension CardView {
//    private var bigText: some View {
//        VStack() {
//            Text(italian ? (wiseWersa ? cardData.rus : cardData.eng) : (wiseWersa ? cardData.rusIt : cardData.it))
//                .font(.largeTitle)
//                .bold()
//                .multilineTextAlignment(.center)
//                .padding()
//        }.padding()
//    }
//    
//    private var littleText: some View {
//        HStack {
//            Text(italian ? (showTranslate ? "*" + (wiseWersa ? cardData.eng.uppercased() : cardData.rus.uppercased()) : (wiseWersa ? "* подсказка" : "* tap to show translate" )) : ((showTranslate ? "*" + (wiseWersa ? cardData.it.uppercased() : cardData.rusIt.uppercased()) : (wiseWersa ? "* подсказка" : "* toccare per visualizzare la traduzione" ))))
//                .font(.subheadline)
//                .fontWeight(.thin)
//                .multilineTextAlignment(.center)
//                .transition(.slide)
//        }
//        .padding()
//        .onTapGesture {
//            withAnimation(.easeOut) {
//                showTranslate.toggle()
//            }
//        }
//    }
//}
//
//struct ArrowFlag: View {
//    @Binding var wiseWersa: Bool
//    @Binding var italian: Bool
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 160) {
//                Text("🇬🇧")
//                    .scaleEffect(italian ? 1.6 : 0.8)
//                    .onTapGesture {
//                        withAnimation {
//                            italian.toggle()
//                        }
//                    }
//                    .shadow(radius: italian ? 7.0 : 1.0)
//
//
//                Text("🇮🇹")
//                    .scaleEffect(italian ? 0.8 : 1.6)
//                    .onTapGesture {
//                        withAnimation(.default) {
//                            italian.toggle()
//                        }
//                    }
//                    .shadow(radius: italian ? 1.0 : 7.0)
//            }.padding()
//
//            Button(action: {
//                withAnimation {
//                    wiseWersa.toggle()
//                }
//            }, label: {
//                Image(systemName: "arrow.2.circlepath")
//                    .font(.title3)
//                    .tint(.black)
//                    .rotationEffect(Angle(degrees: wiseWersa ? 180 : 0))
//            })
//
//        }
//        .frame(maxWidth: .infinity)
//    }
//}
