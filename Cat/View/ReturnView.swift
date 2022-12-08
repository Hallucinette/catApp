//
//  ReturnView.swift
//  Cat
//
//  Created by Esteban SEMELLIER on 08/12/2022.
//

import SwiftUI

struct ReturnView: View {
    @State var isAnim : Bool = false
    @Binding var shouldPopToRootView : Bool
    var body: some View {
        VStack {
            Text("Partie sauvegardée")
                .font(.system(size: 35))
            .rotation3DEffect(.degrees(isAnim ? 360 : 0), axis: (x: 0, y: 1, z: 0))
            .animation(Animation.linear.repeatForever(autoreverses: false).speed(0.05))
            
                .onAppear{
                    self.isAnim = true
            }
            
            Button (action: { self.shouldPopToRootView = false } ){
                            Text("Retour à l'acceuil")
                        }


            
        }
    }
}

struct ReturnView_Previews: PreviewProvider {
    static var previews: some View {
        ReturnView(shouldPopToRootView: .constant(true))
    }
}
