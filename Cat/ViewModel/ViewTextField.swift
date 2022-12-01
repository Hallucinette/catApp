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

//func CompareCode(totcode: Binding<String>, code:  Binding<String>) -> Bool {
//    if totcode != code {
//        Text("Code bon !")
//        return true
//    } else {
//        Text("Code faux")
//        return false
//    }
//}
//if totcode != code {
//    Text("Code bon !")
//} else {
//    Text("Code faux")
//    code1 = ""
//    code2 = ""
//    code3 = ""
//    code4 = ""
//}

//    func codeView(code: Binding<String>) -> some View{
//        TextField("", text: code)
//            .limitTextLength(code, to: 1)
//        //modifier ici le nombre de charactere max
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .frame(width: 50, height: 50)
//            .padding()
//
//    }
