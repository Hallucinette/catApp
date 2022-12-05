//
//  ButtonMap.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 05/12/2022.
//

import SwiftUI


struct ButtonMap: View {
    @State private var bool: Bool = false
    var colorbool: Color = Color.white
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Button(action: {
                    bool = true
                    //enlever  point sur resultat finale!
                    
                }, label: {
                    Image("compass")
                        .resizable()
                        .frame(width: 77.0, height:77.0)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                        .font(.system(.largeTitle))
                })
                .padding()
                .shadow(color: Color.black.opacity(0.3),
                        radius: 3,
                        x: 3,
                        y: 3)
                .sheet(isPresented: $bool) {
                    CompassView()
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
                Spacer()
            }
        }
    }
}

struct ButtonMap_Previews: PreviewProvider {
    static var previews: some View {
        ButtonMap()
    }
}
