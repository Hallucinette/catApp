//
//  SignUpView.swift
//  Cat
//
//  Created by Mahdia Amriou on 06/12/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var userVM: UserViewModel
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text ("INSCRIPTION")
                .foregroundColor(.black)
                .font(.largeTitle)
            
            TextField("Email", text: $userVM.email)
               .font(.title3)
               .textFieldStyle(RoundedBorderTextFieldStyle ())
               .keyboardType(.emailAddress)
               .textInputAutocapitalization(.never)
              
                
            TextField("Confirmer Email", text: $userVM.email)
               .font(.title3)
               .textFieldStyle(RoundedBorderTextFieldStyle ())
               .textContentType(.emailAddress)
               .keyboardType(.emailAddress)
               .textInputAutocapitalization(.never)
            
            SecureField("Mot de passe", text: $userVM.password)
                .font(.title3)
                .textFieldStyle(RoundedBorderTextFieldStyle ())
                .textContentType(.password)
             
            
            Button(action: {
                
                
            },
                   
                label: {
                Text("Sign Up")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.blue)
                            
                )
                
                
            })
            
            
            
        }.padding()
    }
}

struct SignUpViewPreviews: PreviewProvider {
    static var previews: some View {
        SignUpView(userVM: UserViewModel())
    }
}
