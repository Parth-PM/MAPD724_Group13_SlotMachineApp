//
//  MAPD724_Group13_SlotmachinApp.swift
//
//  Date: 2023-02-19
//
//Authors: Parth Maru (301209761)
//         Khushboo Kodwani (301273818)
//         Deep Mehta (301212407)
//


import SwiftUI

@main
struct MAPD724_Group13_SlotMachineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
