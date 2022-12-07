//
//  CatApp.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

@main
struct CatApp: App {
    @StateObject var userVM = UserViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userVM)
            
        }
    }
}
