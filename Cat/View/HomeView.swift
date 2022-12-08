//
//  HomeView.swift
//  Cat
//
//  Created by Esteban SEMELLIER on 07/12/2022.
//
import SwiftUI


//let backgroundGradient9 = LinearGradient(
//   colors: [Color.blue, Color.yellow],
//   startPoint: .top, endPoint: .bottom)

struct HomeView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var isUser: Bool = false
    
    @State var isActive : Bool = false
    @State var userProfileisActive : Bool = false
    
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack{
                
                backgroundGradient
                    .ignoresSafeArea()
                
                VStack{
                    Text("  Chasse aux trésors")
                        .font(.custom("Chasse aux trésors", size:45))
                        .foregroundColor(.yellow)
                        .shadow(color:.black, radius: 3, x:5, y:5)
                    Spacer()
                }.padding(.top, 80)
                    .onAppear{userVM.user.iscreator = false}
                
                VStack(spacing: 20) {
                    
                    LottieView(lottieFile: "tresor")
                        .frame(width: 300, height: 300)
                    
                    
                    Button {
                        
                        
                    } label: {
                        Text("Rejoindre")
                            .foregroundColor(.pink)
                        
                            .frame(width: 250 - 10)
                            .padding(5)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .frame(maxWidth:.infinity, minHeight:44)
                        
                        Spacer()
                        
                    }.shadow(radius: 3, x: 10 , y: 10)
                    NavigationLink(
                        destination: MapView(rootIsActive: self.$isActive).edgesIgnoringSafeArea(.vertical),
                                    isActive: self.$isActive
                                ) {
                                    Button {
                                        self.isActive = true
                                    } label: {
                                        Text("Création")
                                            .foregroundColor(.white)
                                        
                                            .frame(width: 250 - 10)
                                            .padding(5)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                            .frame(maxWidth:.infinity, minHeight:44)
                                    } 
                                }
                                .isDetailLink(false)
                                .shadow(radius: 3, x: 10 , y: 10)
                                .task {
                                    userVM.user.iscreator = true
                                }
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: UserView(rootIsActive: self.$isUser), isActive: self.$isUser) {
                            Button(action: {
                                Task {
                                    userVM.userResponse = try await userVM.getUser()
                                }
                                Task {
                                    self.isUser = true
                                }
                            }) {
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.yellow)
                            }.padding()
                        }
                        .isDetailLink(false)
                    }
                }
            }
        }
        
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
            .environmentObject(AddTargetViewModel())
            .environmentObject(LocationManager())
            .environmentObject(GameViewModel())
    }
}
