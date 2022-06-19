//
//  ContentView.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        
        NavigationView {
            MainScreen()
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
