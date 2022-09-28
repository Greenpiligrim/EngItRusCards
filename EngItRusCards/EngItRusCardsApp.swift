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
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
//            TestView()
            HomeView()
                .environmentObject(vm)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
