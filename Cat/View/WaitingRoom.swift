//
//  WaitingRoom.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 01/12/2022.
//

import SwiftUI

struct WaitingRoom: View {
    
    var code = "1234"
    var nbrUsers = 0
    var numbers:[Int] = [7, 54, 21]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .blue], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack{
                Text("Code d'accès du salon")
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 2)
                    .frame(width: 120, height: 60)
                    .foregroundColor(.white)
                    .overlay(
                        Text(code)
                            .font(.title)
                    )
                    .padding()
                
                HStack {
                    Text("\(users.count) joueurs en attente")
                        .padding(.trailing)
                    DotView()
                    DotView(delay: 0.2)
                    DotView(delay: 0.4)
                }
                .padding(.bottom)

                Rectangle()
                    .frame(width: 350, height: 2)
                    .padding(.bottom)

                ScrollView(showsIndicators: false){
                    ForEach(users){ user in
                        CustList(pseudo: user.pseudo)
                            
                    }
                    
                }
            }
        }
    }
}

struct WaitingRoom_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoom()
    }
}
