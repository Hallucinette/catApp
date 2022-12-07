//
//  TestView.swift
//  Cat
//
//  Created by Mahdia Amriou on 06/12/2022.
//

import SwiftUI


let backgroundGradient9 = LinearGradient(
   colors: [Color.blue, Color.yellow],
   startPoint: .top, endPoint: .bottom)

struct TestView: View {
    var body: some View {
        
        
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
            VStack{
                Text("  Chasse aux trésors")
                    .font(.custom("Chasse aux trésors", size:45))
                    .foregroundColor(.yellow)
                    .shadow(color:.black, radius: 0, x:5, y:5)
                
                Spacer()
            }.padding()
        }
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
