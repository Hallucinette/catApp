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
        
        ZStack{
            backgroundGradient
                .ignoresSafeArea()
            
        
                
                VStack{
                    
                    
                    Text("  Chasse aux trésors")
                        .font(.custom("Chasse aux trésors", size:45))
                        .foregroundColor(.yellow)
                        .shadow(color:.black, radius: 0, x:5, y:5)
                    
                    
                    Spacer()
                }.padding(.top, 80)
                
                
            
                
                VStack(spacing: 20) {
                    
                    LottieView(lottieFile: "tresor")
                        .frame(width: 300, height: 300)
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
}
struct  SigInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(userVM: UserViewModel())
    }
}
