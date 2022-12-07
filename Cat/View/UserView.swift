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
    
    
    @State var parties: [String] = ["Partie 1 ","Partie 2"]
    
    @EnvironmentObject var userVM: UserViewModel
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                backgroundGradient
                
                VStack{
                    
                    Image(systemName: "person.circle")
                    
                        .font(.system(size: 90, weight: .medium))
                    
                    
                    List {
                        Section(
                            header: Text("statistiques")
                                .font(.headline)
                                .foregroundColor(.mint)) {
                                    ForEach(0..<1, id: \.self) { index in
                                        
                                        HStack{
                                            Text("Cumul de points")
                                            Spacer()
                                            
                                            Text("\(userVM.user.totPoint)")
                                                .foregroundColor(.gray)
                                                .font(.callout)
                                        }
                                        
                                        HStack{
                                            Text("Nombre de parties")
                                            Spacer()
                                            Text("\(userVM.user.gameCounter)")
                                                .foregroundColor(.gray)
                                                .font(.callout)
                                        }
                                        
                                        HStack{
                                            Text("Moyenne")
                                            Spacer()
                                            if userVM.user.gameCounter > 0 {
                                                Text("\(userVM.user.totPoint / userVM.user.gameCounter)")
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
                        
                    }.padding()
                    
                    
                    
                    
                    
                    List {
                        Section(
                            header: Text("Parties enregistrées")
                                .font(.headline)
                                .foregroundColor(.mint) ){
                                    ForEach(parties, id:\.self) { partie in
                                        Text(partie.capitalized)
                                    }
                                }
                        
                        
                        //      .listRowBackground(
                        //        Color(.systemFill)
                        //      .clipped()
                        // .cornerRadius(10)
                        //   )
                        
                    }.padding()
                }
                //.navigationTitle("Statistiques")
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink(destination: UserSettingView()){
                            
                            Image(systemName: "gear")
                        }
                    }
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
            .environmentObject(UserViewModel())
        
        
    }
}

