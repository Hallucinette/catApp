//
//  TestView.swift
//  Cat
//
//  Created by Mahdia Amriou on 06/12/2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack{
            Text("  Chasse aux trèsores")
                .font(.custom("Chasse aux trèsores", size:45))
                .foregroundColor(.yellow)
                .shadow(color:.black, radius: 0, x:2, y:2)
           
            Spacer()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
