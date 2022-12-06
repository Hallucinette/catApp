//
//  UserSettingView.swift
//  Cat
//
//  Created by Mahdia Amriou on 05/12/2022.
//

import SwiftUI

let backgroundGradient2 = LinearGradient(
    colors: [Color.blue, Color.yellow],
    startPoint: .top, endPoint: .bottom)


struct UserSettingView: View {
    
        
        @ObservedObject var userVM: UserViewModel
      
        @State private var email = ""
        @State private var newEmail = ""
    
    
    private let PasswordToConfirmAgainst = "12345"
    @State private var password = ""
    @State private var newPassword = ""
    @State private var confirmedPassword = ""
    
    
    private func isPasswordValid() -> Bool {
        if password != PasswordToConfirmAgainst {
            return false
        }
        
        if !newPassword.isEmpty && newPassword == confirmedPassword {
            return true
        }
        
        return false
    }
    
    
    

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
                                    SecureField("Enter old password", text: $password)
                                    SecureField("New Password", text: $newPassword)
                                    SecureField("Confirm New Password", text: $confirmedPassword)
                                }
                                    if self.isPasswordValid() {
                                        Button(action: {
                                            print("Updated password")
                                        }, label: {
                                            Text("Votre mot de passe a été changé")
                                        })
                                    }
                                
                        
                      
                        
                        
                        Section(
                            header: Text("Modifier Email")
                                .font(.headline)
                                .foregroundColor(.mint)) {
                                    TextField("Enter ancien email", text: $email)
                                    TextField("Enter nouveau email", text: $newEmail)
                                }.padding()
                        
                    }
                    
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
                    
                    
                    
                    }.padding()
                    
                    
                   
                    
                    
                    
                    
                }
                
            }
            
            
            
            
            
        }
    
        

    


struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView(userVM: UserViewModel())
    }
}
