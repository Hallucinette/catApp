//
//  ContentView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UserSettingView(userVM: UserViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
