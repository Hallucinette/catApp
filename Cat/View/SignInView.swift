//
//  SigInView.swift
//  Cat
//
//  Created by Mahdia Amriou on 06/12/2022.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var userVM: UserViewModel
    
    
    
    var body: some View {
        
        NavigationView {
            
            
            VStack(spacing: 20) {
                Text ("Connexion")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                
                
                TextField("Email", text: $userVM.email)
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle ())
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                SecureField("Mot de passe", text: $userVM.password)
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle ())
                    .textContentType(.password)
                
                Text(" Sign In")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.blue)
                        
                    )
                
                
             
                
                HStack {
                    Text("Don't have an account ?")
                    NavigationLink {
                        SignUpView(userVM: userVM)
                    } label: {
                        Text("Sign Up")
                    }
                }
            }.padding()
           
        }
    }
    
}

struct  SigInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(userVM: UserViewModel())
    }
}
