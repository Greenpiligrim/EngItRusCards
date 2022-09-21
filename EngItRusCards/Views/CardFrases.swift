//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI
import AVFoundation

struct CardFrases: View {
    @EnvironmentObject private var vm: FrasesViewModel
    let frasses: Frases
    @State var offset: CGSize = .zero

    @State var wiseWersa: Bool = false
    @State var existCard: Bool = true
    @State var showTranslate: Bool = false
    @State var italian: Bool = false
    
    @State var boolFunc: Bool = false
    
    
    var body: some View {
        
        VStack {
//            Text("\(offset.width)")

            if existCard {
                

                    VStack {
                        ArrowFlag(wiseWersa: $wiseWersa, italian: $italian)
                        bigText
                        Spacer()
                        
                       // buttonSpeek
                            
                      
                        littleText
                    }
                    .frame(width: 300, height: 400)
                    .background()
                    .cornerRadius(30)
                    .shadow(color: .red, radius: 30, x: 5)
                    .padding(50)
//                    .onTapGesture {
//                        withAnimation(.easeOut) {
//                            showTranslate.toggle()
//                        }
//                    }
                    .transition(.slide)
                    .onDisappear{
                        withAnimation {
                            existCard.toggle()
                        }
                    }
                    .transition(.slide)
                    .offset(x: offset.width)
                    .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            withAnimation {
                                offset = gesture.translation
                            }
                        }
                    
                        .onEnded { _ in
                            if offset.width > 150 {
                                withAnimation {
                                    vm.nextButtonPressed()
                                    showTranslate = false
                                    existCard.toggle()
                                    offset = .zero
                                }
                            } else {
                                withAnimation(.spring()) {
                                    offset = .zero
                                }
                            }
                        }
                    )
            } else {emptyCard}

            buttOn
        }
    }
   
}

extension CardFrases {


    private var bigText: some View {
        VStack() {
            Text(italian ? (wiseWersa ? frasses.rus : frasses.eng) : (wiseWersa ? frasses.rusIt : frasses.it))
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
        }.padding()
    }


    private var littleText: some View {
        HStack {
            Text(italian ? (showTranslate ? "*" + (wiseWersa ? frasses.eng.uppercased() : frasses.rus.uppercased()) : (wiseWersa ? "* подсказка" : "* tap to show translate" )) : ((showTranslate ? "*" + (wiseWersa ? frasses.it.uppercased() : frasses.rusIt.uppercased()) : (wiseWersa ? "* подсказка" : "* toccare per visualizzare la traduzione" ))))
                .font(.subheadline)
                .fontWeight(.thin)
                .multilineTextAlignment(.center)
            .transition(.slide)
        }
        .onTapGesture {
            showTranslate.toggle()
        }
        .padding()
    }


    private var buttOn: some View {
        Button {
            withAnimation(.easeOut) {
                vm.nextButtonPressed()
                existCard.toggle()
                if showTranslate {
                    showTranslate = false
                }
            }

        } label: {
            Text("Next")
                .padding()
        }
        .buttonStyle(.borderedProminent)
        .tint(.orange)
        .shadow(radius: 10)
       
    }

    private var emptyCard: some View {
        Color.orange
            .frame(width: 500, height: 400)
            .padding(50)
    }
    private var buttonSpeek: some View {
        Button {
          
            if italian {vm.speakEng()} else
            {vm.speakIt()}
                
        } label: {
            Image(systemName: "speaker.wave.3")
        }.tint(.orange)
    }


struct ArrowFlag: View {
    @Binding var wiseWersa: Bool
    @Binding var italian: Bool

    var body: some View {
        VStack {
            HStack(spacing: 160) {
                Text("🇬🇧")
                    .scaleEffect(italian ? 1.6 : 0.8)
                    .onTapGesture {
                        withAnimation {
                            italian.toggle()
                        }
                    }
                    .shadow(radius: italian ? 7.0 : 1.0)


                Text("🇮🇹")
                    .scaleEffect(italian ? 0.8 : 1.6)
                    .onTapGesture {
                        withAnimation(.default) {
                            italian.toggle()
                        }
                    }
                    .shadow(radius: italian ? 1.0 : 7.0)
            }.padding()

            Button(action: {
                withAnimation {
                    wiseWersa.toggle()
                }
            }, label: {
                Image(systemName: "arrow.2.circlepath")
                    .font(.title3)
                    .tint(.black)
                    .rotationEffect(Angle(degrees: wiseWersa ? 180 : 0))
            })

        }
        .frame(maxWidth: .infinity)
    }
}
}
