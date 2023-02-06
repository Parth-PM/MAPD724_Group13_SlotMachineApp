//
//  MAPD724_Group13_SlotMachineApp.swift
//  MAPD724_Group13_SlotMachine
//
//  Created by Parth Maru on 2023-02-05.
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
