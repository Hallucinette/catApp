//
//  MapViewTest.swift
//  TestCatApp
//
//  Created by Guenahele on 01/12/2022.
//


import SwiftUI
import MapKit



struct MapView: View {
    @EnvironmentObject var locationManager : LocationManager
    @EnvironmentObject var addTargetVM : AddTargetViewModel
    @EnvironmentObject var gameVM : GameViewModel
    @State var isShowingModal : Bool = false
    @State var map = MKMapView()
    @State var name = ""
    @State var treasures: [Treasure]  = []
    @Binding var rootIsActive : Bool
    @State var toorIsActive: Bool = false

    
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                
                TextField("Nom de la partie", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Map(addTargetVM: addTargetVM, isShowingModal: $isShowingModal, myMapView: $map)
                    .sheet(isPresented: $isShowingModal) {
                        AddTargetView(map: $map, isShowingModal: $isShowingModal, treasures: $treasures)
                    }
            }.padding(.top, 70)
            
            VStack {
                Spacer()
                
                
                HStack {
                    Button {
                        if name != "" {
                            Task {
                                try await gameVM.CreateGame(name: name)
                            }
                            Task {
                                gameVM.games.append(name)
                                if !gameVM.supress {
                                    gameVM.games.remove(at: 0)
                                }
                            }
                            Task {
                                gameVM.supress = true
                            }
                            Task {
                                self.rootIsActive = false
                            }
                        }
                        
                    } label: {
                        Text("Sauvegarder")
                            .foregroundColor(.white)
                            .frame(width: 150 - 10)
                            .padding(5)
                            .background(name != "" ? Color.blue : Color.gray)
                            .opacity(name != "" ? 1 : 0.7)
                            .cornerRadius(10)
                            .frame(maxWidth:.infinity, minHeight:44)
                }.padding()
                    
                    NavigationLink(destination:WaitingRoom(), isActive: self.$toorIsActive) {
                        Button (action:{
                            if name != "" {
                                Task {
                                    try await gameVM.CreateGame(name: name)
                                }
                                Task {
                                    gameVM.games.append(name)
                                    if !gameVM.supress {
                                        gameVM.games.remove(at: 0)
                                    }
                                }
                                Task {
                                    gameVM.supress = true
                                }
                                Task {
                                    self.toorIsActive = true
                                }
                            }
                            
                        }) {
                            Text("Démarrer")
                                .foregroundColor(.white)
                                .frame(width: 150 - 10)
                                .padding(5)
                                .background(name != "" ? Color.yellow : Color.gray)
                                .opacity(name != "" ? 1 : 0.7)
                                .cornerRadius(10)
                                .frame(maxWidth:.infinity, minHeight:44)
                        }.padding()
                    }
                    
                    
                }

                
                
               /* NavigationLink(destination: ReturnView(shouldPopToRootView: self.$rootIsActive)) {
                    Button(action: {
                        if name != "" {
                            Task {
                                try await gameVM.CreateGame(name: name)
                            }
                            Task {
                                self.rootIsActive = false
                            }
                        }
                    }) {
                        Text("Sauvegarder")
                            .foregroundColor(.white)
                            .frame(width: 150 - 10)
                            .padding(5)
                            .background(name != "" ? Color.blue : Color.gray)
                            .opacity(name != "" ? 1 : 0.7)
                            .cornerRadius(10)
                            .frame(maxWidth:.infinity, minHeight:44)
                    }.padding()
                        }
                        .isDetailLink(false)*/
                }
            }
        }
    }



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(rootIsActive: .constant(false))
            .environmentObject(AddTargetViewModel())
            .environmentObject(LocationManager())
            .environmentObject(GameViewModel())
    }
}
