//
//  ClassementUserView.swift
//  Cat
//
//  Created by Mahdia Amriou on 02/12/2022.
//

import SwiftUI

struct ClassementUserView: View {
    
    @ObservedObject var userVM: UserViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                backgroundGradient1
                
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
                        
                    }.padding()
                    
                    
                    
                }.padding()
                    .navigationBarTitle("Classement")
              
                
               
            }
        }
    }
}

struct ClassementUserView_Previews: PreviewProvider {
    static var previews: some View {
        ClassementUserView(userVM: UserViewModel())
    }
}
