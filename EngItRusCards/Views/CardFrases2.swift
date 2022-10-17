//
//  CardFrasess2.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 17/10/22.
//
import SwiftUI

struct CardFrases2: View {
    let frasses: Frases2
    
    @State var offset: CGSize = .zero
    @State var transition: AnyTransition = .slide
    
    @State var wiseWersa: Bool = false
    @State var existCard: Bool = true
    @State var showTranslate: Bool = false
    @State var italian: Bool = true
    
  
    var body: some View {
        
        VStack {

            if existCard {
                

                    VStack {
                        ArrowFlag(wiseWersa: $wiseWersa, italian: $italian)
                        bigText
                        Spacer()
                        
                            
                      
                        littleText
                    }
                    .frame(width: 300, height: 400)
                    .background()
                    .cornerRadius(30)
                    .shadow(color: .red, radius: 30, x: 5)
                    .padding(50)
                    .onDisappear{
                        withAnimation {
                            existCard.toggle()
                        }
                    }
                    .transition(transition)
                    .offset(x: offset.width)
                    .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            withAnimation {
                                offset = gesture.translation
                            }
                        }
                    
                        .onEnded { _ in
                            if offset.width > 30 {
                                ifMore()
                            } else {
                                if offset.width < 0 {
                                    ifLess()
                                } else {
                                    withAnimation(.spring()) {
                                        offset = .zero
                                    }
                                }
                            }
                        }
                    )
            } else {emptyCard}
        }
    }
}

extension CardFrases2 {
    
    func ifMore() {
        transition = .slide
        withAnimation(.easeOut(duration: 0.1)) {
           // vm.nextButtonPressed()
            showTranslate = false
            existCard.toggle()
            offset = .zero
        }
    }
    
    func ifLess() {
        transition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
        withAnimation(.easeIn(duration: 0.1)) {
           // vm.backButtonPressed()
            showTranslate = false
            existCard.toggle()
            offset = .zero
        }
    }


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
                //vm.nextButtonPressed()
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
            .frame(width: 300, height: 400)
            .background()
            .cornerRadius(30)
            .padding(50)
            .transition(.slide)
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
                    .rotationEffect(Angle(degrees: wiseWersa ? 180 : 0))
            })

        }
        .frame(maxWidth: .infinity)
    }
}
}
