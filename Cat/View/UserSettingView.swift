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
    
    
        private let EmailToConfirmAgainst = "user@email.com"
        @State private var email = ""
        @State private var newEmail = ""
        @State private var confirmedEmail = ""
    
    
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
    
    
    
    
    private func isEmailValid() -> Bool {
        if email != EmailToConfirmAgainst {
            return false
        }
        
        if !newEmail.isEmpty && newEmail == confirmedEmail {
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
                                    SecureField("Enter ancien mot de passe", text: $password)
                                    SecureField("Nouveau mot de passe", text: $newPassword)
                                    SecureField("Confirmer nouveau mot de passe", text: $confirmedPassword)
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
                                    SecureField("Enter ancien email", text: $email)
                                    SecureField("Nouveau email", text: $newEmail)
                                    SecureField("Confirmer nouveau email", text: $confirmedEmail)
                                }
                                    if self.isEmailValid() {
                                        Button(action: {
                                            print("Updated password")
                                        }, label: {
                                            Text("Votre email a été changé")
                                        })
                                    }
                        
                    }.cornerRadius(20)
                    
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
                        
                    }.padding(.top,150)
                    
                    
                    
                    }.padding()
                    
                    
                   
                    
                    
                    
                    
                }
                
            }
            
            
            
            
            
        }
    
        

    


struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView(userVM: UserViewModel())
    }
}
