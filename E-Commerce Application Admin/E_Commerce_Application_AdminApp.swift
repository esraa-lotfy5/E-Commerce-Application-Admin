//
//  E_Commerce_Application_AdminApp.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import SwiftUI

@main
struct E_Commerce_Application_AdminApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
