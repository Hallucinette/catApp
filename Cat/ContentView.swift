//
//  ContentView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var locationManager : LocationManager
    @EnvironmentObject var addTargetVM : AddTargetViewModel
    @EnvironmentObject var GameVM : GameViewModel
    
    var body: some View {
        

        if UserDefaults.standard.value(forKey: "userId") != nil {
            HomeView()
//                .onAppear {
//                    UserDefaults.standard.removeObject(forKey: "userId")
//                }
        } else {
            SignInView()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
            .environmentObject(AddTargetViewModel())
            .environmentObject(LocationManager())
            .environmentObject(GameViewModel())
    }
}
