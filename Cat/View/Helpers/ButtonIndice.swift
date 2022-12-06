//
//  ButtonIndice.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 05/12/2022.
//

import SwiftUI

struct TreasureForExemple {
    var indice1 = "Ceci est un test 1"
    var indice2 = "Ceci est un test 2"
}


struct ExpandableButton: View {
    
    @State var treasure: TreasureForExemple
    
    @State var isExpanded = false
    
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    isExpanded.toggle()
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.green)
                }
                .padding()
                
                if isExpanded {
                    ButtonsIndiceView(buttonImage: "lightbulb.fill", indice: treasure.indice1)
                    ButtonsIndiceView(buttonImage: "lightbulb.fill", indice: treasure.indice2)
                }
                Spacer()
            }
            .animation(.spring())
            Spacer()
        }
    }
}

struct ExpandableButton_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableButton(treasure: TreasureForExemple(indice1: "Ceci est un test 1", indice2: "Ceci est un test 2"))
    }
}
