//
//  AddTargetView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 02/12/2022.
//

import SwiftUI

struct AddTargetView: View {
    @State var nameObj: String = ""
    @State var indic: String = ""
    @State var indice1: String = ""
    @State var indice2: String = ""
    
    var txt = ""
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "gift.circle")
                    .font(.system(size: 57))
                    .foregroundColor(Color("OrangeCust"))
                Text("Remplis les informations")
                    .font(.title)
                    .bold()
                    .padding()
            }
            
            My_TextField1(text: $nameObj, txt: "Nom de l'objet")
            My_TextField1(text: $indic, txt: "indication")
            My_TextField1(text: $indice1, txt: "Indice 1")
            My_TextField1(text: $indice2, txt: "Indice2 ")
            
            VStack{
                Button {
                    // Button Annuler
                    // A configurer avec le back
                } label: {
                    buttonCust(textLabel: getButtonType(ButtonT: .Annuler), colorCust: getColor(colorT: .orangeCust))
                }
                
                Button {
                    // Button Enregistrer
                    // A configurer avec le back
                } label: {
                    buttonCust(textLabel: getButtonType(ButtonT: .Enregistrer), colorCust: getColor(colorT: .blueCust))
                }
            }
            .padding()

        }
    }
}

struct AddTargetView_Previews: PreviewProvider {
    static var previews: some View {
        AddTargetView()
    }
}
