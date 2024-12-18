//
//  MemoGrammarlyApp.swift
//  MemoGrammarly
//
//  Created by 스마트 on 2024/12/18.
//

import SwiftUI

@main
struct MemoGrammarlyApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
