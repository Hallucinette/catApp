//
//  HomeView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 04/12/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "person.circle")
                    .font(.system(size: 40))
                    .padding()
            }
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
            
            Button {
                //dest
            } label: {
                buttonCust(textLabel: getButtonType(ButtonT: .Rejoindre), colorCust: getColor(colorT: .blueCust))
            }
            .padding()
            
            Button {
                //dest
            } label: {
                buttonCust(textLabel: getButtonType(ButtonT: .Création), colorCust: getColor(colorT: .orangeCust))
            }
            .padding()
            
            Spacer()

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
