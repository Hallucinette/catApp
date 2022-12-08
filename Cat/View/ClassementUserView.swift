//
//  ClassementUserView.swift
//  Cat
//
//  Created by Mahdia Amriou on 02/12/2022.
//

import SwiftUI


let backgroundGradient7 = LinearGradient(
    colors: [Color.blue, Color.yellow],
    startPoint: .top, endPoint: .bottom)

struct ClassementUserView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                backgroundGradient7
                  .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    
                    List{
                        ForEach(0..<userVM.sortedUsers.count, id: \.self) { index in
                            HStack{
                                Text("\(index+1):")
                                    .foregroundColor(.yellow)
                                   .font(.title2)
                                    .fontWeight(.bold)
                                Text(userVM.sortedUsers[index].pseudo)
                                    .foregroundColor(.blue)
                                 //   .font(.title2)
                                    .fontWeight(.bold)
                            Spacer()
                                Text("\(userVM.sortedUsers[index].totPoint) Points")
                                    .foregroundColor(.blue)
                                
                            }
                            
                        }
                        
                    }.scrollContentBackground(.hidden)
                }.padding()
                    .navigationBarTitle("Classement")
            }
        }
    }
}

struct ClassementUserView_Previews: PreviewProvider {
    static var previews: some View {
        ClassementUserView()
            .environmentObject(UserViewModel())
    }
}
