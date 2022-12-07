//
//  ContentView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel
    var body: some View {

        if userVM.isConnected {
            Text("Connecté")
        } else {
            SignUpView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
    }
}
