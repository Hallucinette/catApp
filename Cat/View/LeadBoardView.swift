//
//  LeadBoardView.swift
//  Cat
//
//  Created by Mahdia Amriou on 04/12/2022.
//

import SwiftUI

let backgroundGradient3 = LinearGradient(
    colors: [Color.blue, Color.yellow],
    startPoint: .top, endPoint: .bottom)


struct LeadBoardView: View {
    
    @ObservedObject var userVM: UserViewModel
   
    var body: some View {
        ZStack{
            backgroundGradient3
            VStack{
                
                Image("winning")
                    .resizable()
                    .frame(width: 150.0, height: 150.0)
                Text("VICTOIRE")
                    .foregroundColor(.black)
                    .bold()
                
                
                Spacer()
                
                
                List {
                    Section(
                        header:
                            HStack{
                                Text("Le gagnant")
                                Image(systemName: "star.fill")
                            }
                            .font(.headline)
                            .foregroundColor(.mint)
                    
                    ){
                                ForEach(0..<1, id: \.self) { index in
                                    HStack{
                                        ZStack{
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 40.0, height: 40.0)
                                                .foregroundColor(.yellow)
                                                
                                            Text("\(index+1)")
                                        }
                                        Text(userVM.sortedUsers[0].pseudo)
                                        Spacer()
                                        Text("\(userVM.sortedUsers[0].totPoint) Points")
                                    }
                                }
                    }
                    
                    
                    Section(
                        header:
                            HStack{
                                Text("Paudium")
                                Image(systemName: "sparkles")
                             
                            }
                            .font(.headline)
                            .foregroundColor(.mint)
                    
                    ){
                                ForEach(0..<3, id: \.self) { index in
                                    HStack{
                                        ZStack{
                                            Image(systemName: "circle.fill")
                                                .resizable()
                                                .frame(width: 30.0, height: 30.0)
                                                .foregroundColor(.yellow)
                                                
                                            Text("\(index+1)")
                                        }
                
                                        Text(userVM.sortedUsers[index].pseudo)
                                        Spacer()
                                        Text("\(userVM.sortedUsers[index].totPoint) Points")
                                        
                                    }
                                }
                    }.padding(.vertical,14)
                    
                }
               
                Button {
                    
                    
                } label: {
                    Text("Retour au menu")
                        .foregroundColor(.red)
                    
                        .frame(width: 250 - 10)
                        .padding(5)
                        .background(Color(white: 0.9))
                        .cornerRadius(10)
                        .frame(maxWidth:.infinity, minHeight:44)
                    
                    Spacer()
                    
                }
            }.padding()
            
        }.padding()
       
    }
}

struct LeadBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeadBoardView(userVM: UserViewModel())
    }
}
