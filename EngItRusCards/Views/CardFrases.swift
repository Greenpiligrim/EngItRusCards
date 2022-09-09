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
    
    @State var wiseWersa: Bool = false
    @State var existCard: Bool = true
    @State var showTranslate: Bool = false
    @State var italian: Bool = false
    
    @State var boolFunc: Bool = false
    
    
    var body: some View {
        
        VStack {

            if existCard {
                

                    VStack {
                        ArrowFlag(wiseWersa: $wiseWersa, italian: $italian)
                        bigText
                        Spacer()
                        
                        buttonSpeek
                            
                      
                        littleText
                    }
                    .frame(width: 300, height: 400)
                    .background()
                    .cornerRadius(30)
                    .shadow(color: .red, radius: 30, x: 5)
                    .padding(50)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            showTranslate.toggle()
                        }
                    }
                    .transition(.slide)
                    .onDisappear{
                        withAnimation {
                            existCard.toggle()
                        }
                    }
                    .transition(.slide)
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
        .shadow(radius: 20)
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

                Text("🇮🇹")
                    .scaleEffect(italian ? 0.8 : 1.6)
                    .onTapGesture {
                        withAnimation(.default) {
                            italian.toggle()
                        }
                    }
            }.padding()

            Button(action: {
                withAnimation {
                    wiseWersa.toggle()
                }
            }, label: {
                Image(systemName: "arrow.counterclockwise")
                    .tint(.white)
                    .rotationEffect(Angle(degrees: wiseWersa ? 180 : 0))
            })

        }
        .frame(maxWidth: .infinity)
    }
}
}
