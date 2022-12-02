//
//  button.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import SwiftUI

struct buttonCust: View {
    var textLabel: String
    var colorCust: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25,
                             style: .continuous)
            .fill(Color(colorCust))
            .frame(width: 230, height: 50)
            Text(textLabel)
                .foregroundColor(.black)
                .font(.title3)
        }
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        buttonCust(textLabel: getButtonType(ButtonT: ButtonType.Rejoindre), colorCust: getColor(colorT: .blueCust))
    }
}
