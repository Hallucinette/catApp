//
//  CodeGameView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

struct CodeGameView: View {

    @State var text = ""
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
                
                My_TextField2(text: code1)
                My_TextField2(text: code2)
                My_TextField2(text: code3)
                My_TextField2(text: code4)

            }
            .padding()
            
            Button {
                // destination
            } label: {
                buttonCust(textLabel: getButtonType(ButtonT: .Rejoindre), colorCust: getColor(colorT: .blue))
            }
            .padding()

        }
        .padding()
    }
}

struct CodeGameView_Previews: PreviewProvider {
    static var previews: some View {
        CodeGameView()
    }
}

struct TextLengthLimiter: ViewModifier {
  @Binding var text: String
  let maxLength: Int

  func body(content: Content) -> some View {
    content
      .onReceive(text.publisher.collect()) { output in
        text = String(output.prefix(maxLength)) // HERE
    }
  }
}

extension TextField {
  func limitTextLength(_ text: Binding<String>,
                       to maxLength: Int) -> some View {
    self.modifier(TextLengthLimiter(text: text,
                                    maxLength: maxLength))
  }
}

struct My_TextField2: View {
    @State var text = ""

    var body: some View {
        TextField("", text: $text)
            .limitTextLength($text, to: 1)
                    //modifier ici le nombre de charactere max
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 50, height: 50)
            .padding()
    }
}
