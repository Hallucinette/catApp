//
//  DotView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 02/12/2022.
//

import SwiftUI


struct DotView: View {
    @State var scale: CGFloat = 0.5
    @State var delay: CGFloat = 0 //1

    var body: some View {
        Circle()
            .frame(width: 15, height: 15)
            .scaleEffect(scale) // 2
            .onAppear{ // 1
                withAnimation(.easeInOut.repeatForever().delay(delay)) {  // 2
                    self.scale = 1 //3
                }
            }
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .stroke(.gray, lineWidth: 2)
                .frame(width: 110, height: 40)
                .foregroundColor(.white)
                .overlay(
                    HStack {
                        DotView()
                        DotView(delay: 0.2)
                        DotView(delay: 0.4)
                    }
                )
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
