//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI

@main
struct EngItRusCardsApp: App {
    @StateObject private var vm = FrasesViewModel()
    var body: some Scene {
        WindowGroup {
            TestView()
//            FrasesView()
                .environmentObject(vm)
        }
    }
}
