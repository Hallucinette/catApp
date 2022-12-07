//
//  TreasureListView.swift
//  Cat
//
//  Created by Mahdia Amriou on 05/12/2022.
//

import SwiftUI

let backgroundGradient4 = LinearGradient(
    colors: [Color.blue, Color.yellow],
    startPoint: .top, endPoint: .bottom)

struct TreasureView: View {
    
    @ObservedObject var teasureVM: TreasureViewModel
    
    @State private var showConfirm = false
    @State private var indexSetToDelete: IndexSet?
    
    
    func deleteTreasure(at offset: IndexSet) {
        guard let newIndex = Array(offset).first else { return }
        teasureVM.deleteTreasure(index: newIndex)
    }
    
    
    var body: some View {
        NavigationView {
            
            ZStack{
                backgroundGradient4
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    
                    List{
                        ForEach(0..<teasureVM.treasures.count, id: \.self) { index in
                            HStack{
                                Text("\(index+1):")
                                    .foregroundColor(.yellow)
                                   .font(.title2)
                                    .fontWeight(.bold)
                                Text(teasureVM.treasures[index].name)
                                    .foregroundColor(.blue)
                                 //   .font(.title2)
                                    .fontWeight(.bold)
                            Spacer()
                                
                                
                            }
                            
                        }
                        
                        
                        .onDelete { indexSet in
                           showConfirm.toggle()
                            indexSetToDelete = indexSet
                       }
                        .onMove { fromOffsets, toOffset in
                            teasureVM.treasures.move(fromOffsets: fromOffsets, toOffset: toOffset)
                          }
                  
                  //l'alerte de confirmation
                  
                        .alert("Êtes vous sûr ?", isPresented: $showConfirm) {
                            Button("Delete", role: .destructive) {
                                deleteTreasure(at: indexSetToDelete!)
                          }
                            Button("Cancel", role: .cancel) { }
                        }
                        
                        
                        
                    }.scrollContentBackground(.hidden)
                        
                    
                  
                        
                        
                        Button {
                            
                            
                        } label: {
                            Text("Commencer")
                                .foregroundColor(.red)
                            
                                .frame(width: 250 - 10)
                                .padding(5)
                                .background(Color(white: 0.9))
                                .cornerRadius(10)
                                .frame(maxWidth:.infinity, minHeight:44)
                            
                            Spacer()
                            
                        }.padding()
                        
                        
                    }.padding()
                        .navigationBarTitle("Liste des objets")
                        .navigationBarItems(leading: EditButton())
                        .foregroundColor(.black)
                    
                    
                }
            }
            
        }
        
        
}

struct TreasureView_Previews: PreviewProvider {
    static var previews: some View {
        TreasureView(teasureVM: TreasureViewModel())
    }
}
