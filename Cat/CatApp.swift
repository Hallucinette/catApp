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
    @StateObject var locationManager = LocationManager()
    @StateObject var addTargetVM = AddTargetViewModel()
    @StateObject var gameVM = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userVM)
                .environmentObject(locationManager)
                .environmentObject(addTargetVM)
                .environmentObject(gameVM)
            
            
        }
    }
}
