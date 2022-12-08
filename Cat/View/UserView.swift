//
//  UserView.swift
//  Cat
//
//  Created by Mahdia Amriou on 30/11/2022.
//

import SwiftUI




let backgroundGradient = LinearGradient(
    colors: [Color.blue, Color.yellow],
    startPoint: .top, endPoint: .bottom)

struct UserView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var gameVM: GameViewModel
    
    @Binding var rootIsActive : Bool
    @State var toorIsActive: Bool = false
    

 
    var body: some View {
        
        NavigationView {
            
            ZStack{
                backgroundGradient
                    .ignoresSafeArea()
                
                VStack{
                    
                    Image(systemName: "person.circle")
                    
                        .font(.system(size: 90, weight: .medium))
                    List {
                        Section(
                            header: Text("statistiques")
                                .font(.headline)
                                .foregroundColor(.yellow)) {
                                    ForEach(0..<1, id: \.self) { _ in
                                        
                                        HStack{
                                            Text("Cumul de points")
                                            Spacer()
                                            
                                            Text("\(userVM.userResponse.totalPoints)")
                                                .foregroundColor(.gray)
                                                .font(.callout)
                                        }
                                        
                                        HStack{
                                            Text("Nombre de parties")
                                            Spacer()
                                            Text("\(userVM.userResponse.gameCount)")
                                                .foregroundColor(.gray)
                                                .font(.callout)
                                        }
                                        
                                        HStack{
                                            Text("Moyenne")
                                            Spacer()
                                            if userVM.userResponse.gameCount > 0 {
                                                Text("\(userVM.userResponse.totalPoints / userVM.userResponse.gameCount)")
                                                    .foregroundColor(.gray)
                                                    .font(.callout)
                                            } else {
                                                Text("0")
                                                    .foregroundColor(.gray)
                                                    .font(.callout)
                                            }
                                            
                                        }
                                        
                                    }.padding(.vertical,12)
                                }
                        
                    }.scrollContentBackground(.hidden)
                    
                    List {
                        Section(
                            header: Text("Parties enregistrées")
                                .font(.headline)
                                .foregroundColor(.blue) ){
                                    if !gameVM.supress {
                                        Text(gameVM.games[0])
                                            .foregroundColor(.gray)
                                    } else {
                                        ForEach(gameVM.games, id:\.self) { game in
                                            Text(game.capitalized)
                                    }
                                  
                                    }
                                }
                    }.scrollContentBackground(.hidden)
                }
                .padding()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: UserSettingView(pop: self.$toorIsActive, rootIsActive: $rootIsActive), isActive: self.$toorIsActive) {
                                Button(action: {
                                    toorIsActive = rootIsActive
                                }) {
                                    Image(systemName: "gear")
                                        .foregroundColor(.yellow)
                                }.padding()
                            }
                            .isDetailLink(false)
                        }
                    }
            }
            .onAppear {
                userVM.user.id = userVM.userResponse.id
                userVM.user.email = userVM.userResponse.email
                userVM.user.totPoint = userVM.userResponse.totalPoints
                userVM.user.gameCounter = userVM.userResponse.gameCount
            }
        }
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(rootIsActive: .constant(false))
            .environmentObject(UserViewModel())
            .environmentObject(GameViewModel())
        
        
    }
}

