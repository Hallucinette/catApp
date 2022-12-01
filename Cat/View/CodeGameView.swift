//
//  CodeGameView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

struct CodeGameView: View {

   // Variable ephemere, A supprimer. Correspond a Game.code
    @State var code = "1234"
    
    @State var username: String = ""
    @State private var code1: String = ""
    @State private var code2: String = ""
    @State private var code3: String = ""
    @State private var code4: String = ""
    
    var body: some View {
        VStack{
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading){
                
                Text("Pseudo")
                    .font(.callout)
                    .bold()
                TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
                    print("Username onEditingChanged - \(changed)")
                }) {
                    print("Username onCommit")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.vertical)
            
            Text("Code de la partie")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            HStack {
                
            //    codeView(code: $code1)
                My_TextField2(text: $code1)
                My_TextField2(text: $code2)
                My_TextField2(text: $code3)
                My_TextField2(text: $code4)

            }
            .padding()
            
            let totcode = code1 + code2 + code3 + code4
           // Text(totcode)
            
            if (code1 != "" && code2 != "" &&
                code3 != "" && code4 != "") {
                Text(CompareCode(totcode: totcode, code: code))
            }
            
            Button {
                // destination
                // condition : que le code sois juste
                // consequence = Ajout du user dans la partie
                // redirection sur la salle d'attente
            } label: {
                buttonCust(textLabel: getButtonType(ButtonT: .Rejoindre), colorCust: getColor(colorT: .blueCust))
            }
            .padding()

        }
        .padding()
    }
    
    func CompareCode(totcode: String, code: String) -> String {
        if totcode == "" {
            return ""
        }
        if totcode != code {
            return "Code faux !"
        } else {
            return "Code bon"
        }
    }

}

struct CodeGameView_Previews: PreviewProvider {
    static var previews: some View {
        CodeGameView()
    }
}
