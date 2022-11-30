//
//  button.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

struct button: View {
    var textLabel: String
    var colorCust: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25,
                             style: .continuous)
            .fill(Color(colorCust))
            .frame(width: 230, height: 50)
            Text(textLabel)
        }
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        button(textLabel: getButtonType(ButtonT: ButtonType.Enregistrer), colorCust: getColor(colorT: color.blue))
    }
}
