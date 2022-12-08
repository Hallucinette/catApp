//
//  SignUpView.swift
//  Cat
//
//  Created by Mahdia Amriou on 06/12/2022.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        
        
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
            VStack{
                Text("  Chasse aux trésors")
                    .font(.custom("Chasse aux trésors", size:45))
                    .foregroundColor(.yellow)
                    .shadow(color:.black, radius: 2, x:5, y:5)
                
                Spacer()
            }.padding()
            
            VStack(spacing: 20) {
                Text ("Inscription")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                
                TextField("Email", text: $userVM.email)
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle ())
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                
                
                TextField("Confirmer email", text: $userVM.repeatEmail)
                
                
                
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle ())
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                
                SecureField("Mot de passe", text: $userVM.password)
                    .font(.title3)
                    .textFieldStyle(RoundedBorderTextFieldStyle ())
                    .textContentType(.password)
                
                
                Button(action: {
                    // Action inscription
                    if userVM.email == userVM.repeatEmail {
                        
                        // Inscription
                        Task {
                            print("go inscription")
                            let _ = try await userVM.signUp(sendEmail: userVM.email, sendPassword: userVM.password)              
                        }
                        // Connexion
                        Task {
                            try await Task.sleep(nanoseconds: 3_000_000_000)
                            print("go connexion")
                            let _ = try await userVM.signIn(email: userVM.email, password: userVM.password)
                            userVM.isConnected = true
                        }
                    }
                },
                       label: {
                    Text("Sign Up") 
                })
            }.padding()
        }
    }
}

struct SignUpViewPreviews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(UserViewModel())
    }
}
