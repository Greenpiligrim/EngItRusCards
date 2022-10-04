//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import Foundation
import SwiftUI
import AVFoundation

class FrasesViewModel: ObservableObject {
    
   
    //All loaded data
    @Published var frasesArrayPublisher: [Frases] = []
    
    //Current data
    @Published var frasesArray: Frases {
      
        didSet {
            updateFrases(frases: frasesArray)
        }
    }
    @Published var frasesPublisherStart: Frases = Frases(eng: "", rus: "", it: "", rusIt: "")
    
    
    init() {
        let instanse = EnglishFrasesDataServise.FrasesCard
        self.frasesArrayPublisher = instanse
        self.frasesArray = instanse.first!
        
        self.updateFrases(frases: instanse.first!)
        print("init")
        
    }
    
    
    private func updateFrases(frases: Frases) {
        
        frasesPublisherStart = Frases(
            eng: frases.eng,
            rus: frases.rus,
            it: frases.it,
            rusIt: frases.rusIt
        )
    }
    private func showNextFrases(frasses: Frases) {
        
        frasesArray = frasses
        
    }
    
    func nextButtonPressed() {
        
        //get the currentindex
        guard
            let currentIndex = frasesArrayPublisher.firstIndex(where: {$0 == frasesArray}) else {
            print("could not find correct index")
            return
        }
        
        //check if the current index is valid
        let nextIndex = currentIndex + 1
        guard frasesArrayPublisher.indices.contains(nextIndex) else {
            
            //Next index is not valid
            //Restart from 0
            guard let firstFrass = frasesArrayPublisher.first else {
                return
            }
            showNextFrases(frasses: firstFrass)
            return
        }
        
        //Next index is Valid
        let nextFrasses = frasesArrayPublisher[nextIndex]
        showNextFrases(frasses: nextFrasses)
        
    }
    

    
    func backButtonPressed() {
        
        //get the currentindex
        guard
            let currentIndex = frasesArrayPublisher.firstIndex(where: {$0 == frasesArray}) else {
            print("could not find correct index")
            return
        }
        
        //check if the current index is valid
        let beforeIndex = currentIndex - 1
        guard frasesArrayPublisher.indices.contains(beforeIndex) else {
            
            //Next index is not valid
            //Restart from 0
            guard let firstFrass = frasesArrayPublisher.first else {
                return
            }
            showNextFrases(frasses: firstFrass)
            return
        }
        
        //Next index is Valid
        let nextFrasses = frasesArrayPublisher[beforeIndex]
        showNextFrases(frasses: nextFrasses)
        
    }
    
}

