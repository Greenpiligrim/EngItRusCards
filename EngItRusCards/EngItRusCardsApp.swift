//
//  EngItRusCardsApp.swift
//  EngItRusCards
//
//  Created by Vladimir Vasilenko on 09/09/22.
//

import SwiftUI

@main
struct EngItRusCardsApp: App {
    @StateObject private var dataController = PersistController()
    @StateObject private var vm = FrasesViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
