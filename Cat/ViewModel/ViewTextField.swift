//
//  ViewTextField.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 01/12/2022.
//

import Foundation
import SwiftUI

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
    @Binding var text: String

    var body: some View {
        TextField("", text: $text)
            .limitTextLength($text, to: 1)
                    //modifier ici le nombre de charactere max
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 50, height: 50)
            .padding()
    }
}

// ---> La meme chose mais en fonction :
//func CompareCode(totcode: Binding<String>, code:  Binding<String>) -> Bool {
//    if totcode != code {
//        Text("Code bon !")
//        return true
//    } else {
//        Text("Code faux")
//        return false
//    }
//}

struct My_TextField1: View {
    @Binding var text: String
    var txt: String

    var body: some View {
        VStack(alignment: .leading){
            Text(txt)
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
