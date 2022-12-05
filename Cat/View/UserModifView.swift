//
//  UserModifView.swift
//  Cat
//
//  Created by Mahdia Amriou on 02/12/2022.
//

import SwiftUI


let backgroundGradient2 = LinearGradient(
    colors: [Color.blue, Color.yellow],
    startPoint: .top, endPoint: .bottom)

//let backgroundGradient2 = LinearGradient(
   // colors: [Color.red.opacity(0.5),Color.gray.opacity(0.5), //Color.mint.opacity(0.5)],
   
   // startPoint: .top, endPoint: .bottom)


struct UserModifView: View {
    
    @ObservedObject var userVM: UserViewModel
    
    @State private var Password = ""
    @State private var newPassword = ""
    @State private var confirmedPassword = ""
    @State private var Email = ""
    @State private var newEmail = ""
    
    var body: some View {
        ZStack{
            backgroundGradient2
            
            VStack{
                
                Image(systemName: "person.circle")
                
                    .font(.system(size: 90, weight: .medium))
                
                
                Form{
                    Section(
                        header: Text("Modifier mot de passe")
                            .font(.headline)
                            .foregroundColor(.mint)) {
                                SecureField("Enter ancien mot de passe", text: $Password)
                                SecureField("Nouveau mot de passe", text: $newPassword)
                                SecureField("Confirmer nouveau mot de passe", text: $confirmedPassword)
                            }
                    
                    Section(
                        header: Text("Modifier Email")
                            .font(.headline)
                            .foregroundColor(.mint)) {
                                TextField("Enter ancien email", text: $Email)
                                TextField("Enter nouveau email", text: $newEmail)
                            }.padding()
                    
                    
                }.padding()
                
                
                Button {
                    
                    
                } label: {
                    Text("Save")
                        .foregroundColor(.mint)
                    
                        .frame(width: 100 - 10)
                        .padding(5)
                        .background(Color(white: 0.9))
                    //  .background(Color.gray)
                        .cornerRadius(10)
                        .frame(maxWidth:.infinity, minHeight:44)
                    
                    
                    
                }.padding()
                
                
                Button {
                    
                    
                } label: {
                    Text("Déconnexion")
                        .foregroundColor(.red)
                    
                        .frame(width: 250 - 10)
                        .padding(5)
                        .background(Color(white: 0.9))
                        .cornerRadius(10)
                        .frame(maxWidth:.infinity, minHeight:44)
                    
                    Spacer()
                    
                }.padding()
                
            }
            
        }
        
    }
}
    
    struct UserModifView_Previews: PreviewProvider {
        static var previews: some View {
            UserModifView(userVM: UserViewModel())
        }
    }
    

