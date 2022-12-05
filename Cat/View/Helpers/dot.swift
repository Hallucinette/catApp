//
//  dot.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 02/12/2022.
//

import SwiftUI

struct DotView: View {
    var body: some View {
        Circle()
            .frame(width: 70, height: 70)
    }
}

struct DotView: PreviewProvider {
    static var previews: some View {
        DotView()
    }
}
