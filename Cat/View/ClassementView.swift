//
//  ClassementView.swift
//  Cat
//
//  Created by Mahdia Amriou on 30/11/2022.
//

import SwiftUI

let backgroundGradient1 = LinearGradient(
    colors: [Color.blue, Color.yellow],
    startPoint: .top, endPoint: .bottom)


//let backgroundGradient1 = LinearGradient(
 //   colors: [Color.mint.opacity(0.5),Color.gray.opacity(0.5), Color.pink.opacity(0.5)],
 //   startPoint: .top, endPoint: .bottom)


struct ClassementView: View {
    
    @ObservedObject var userVM: UserViewModel
    
    @State private var showConfirm = false
    @State private var indexSetToDelete: IndexSet?
    
    
    func deleteUser(at offset: IndexSet) {
        guard let newIndex = Array(offset).first else { return }
        userVM.deleteUser(index: newIndex)
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                backgroundGradient1
                
                VStack(alignment: .center) {
                    
                    List{
                        // ForEach (userVM.users.sorted(by: { $0.totPoint > $1.totPoint}))
                        
                        
                             ForEach (userVM.sortedUsers.indices, id: \.self){ index in
                        
                        //  ForEach(0..<userVM.sortedUsers.count, id: \.self){ index in
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
                            }
                            
                            
                        }
                              .onDelete { indexSet in
                                 showConfirm.toggle()
                                  indexSetToDelete = indexSet
                             }
                              .onMove { fromOffsets, toOffset in
                                    userVM.users.move(fromOffsets: fromOffsets, toOffset: toOffset)
                                }
                        
                        //l'alerte de confirmation
                        
                                .alert("Êtes vous sûr ?", isPresented: $showConfirm) {
                                    Button("Delete", role: .destructive) {
                                       deleteUser(at: indexSetToDelete!)
                                  }
                                  Button("Cancel", role: .cancel) { }
                              }
                        
                        
                             }.padding()
                        
                        
                        Button {
                            
                            
                        } label: {
                            Text("Rappel")
                                .foregroundColor(.red)
                            
                                .frame(width: 250 - 10)
                                .padding(5)
                                .background(Color(white: 0.9))
                                .cornerRadius(10)
                                .frame(maxWidth:.infinity, minHeight:44)
                            
                            Spacer()
                            
                        }.padding()
                        
                        
                    }.padding()
                        .navigationBarTitle("Classement")
                        .navigationBarItems(leading: EditButton())
                    
                    
                }
            }
            
        }
        
        
    }
    
    
    
    
    struct ClassementView_Previews: PreviewProvider {
        static var previews: some View {
            ClassementView(userVM: UserViewModel())
        }
    }
    

