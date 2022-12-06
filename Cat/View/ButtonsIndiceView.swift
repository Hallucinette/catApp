//
//  ButtonsIndiceView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 06/12/2022.
//

import SwiftUI



struct ButtonsIndiceView: View {
    var buttonImage: String
    var indice: String
    var indiceTitle = "Indice"
    @State private var presentAlert = false
    
    var body: some View {
        Button(action: {
            //print("Menu Button tapped")
            presentAlert = true
            
        }) {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 50, height: 50)
                
                Image(systemName: buttonImage)
                    .imageScale(.large)
                    .foregroundColor(.white)
                
            }
        }
        .alert(isPresented: $presentAlert) {
            
            Alert(
                title: Text(indiceTitle),
                message: Text(indice)
            )
        }
    }
}

struct ButtonsIndiceView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsIndiceView(buttonImage: "lightbulb.fill", indice: "Voici un test")
    }
}
