//
//  TreasureListViewModel.swift
//  Cat
//
//  Created by Mahdia Amriou on 05/12/2022.
//

import Foundation
class TreasureViewModel: ObservableObject {
    
    
    
    @Published var treasures: [Treasure] = [
        
        Treasure(id: 1, name: "treasure1", latitude: 0.1, longitude:0.1, indice1: "indice1", indice2: "indice2", indication: "un indice", gameId: 1),
        Treasure(id: 2, name: "treasure2", latitude: 0.1, longitude:0.1, indice1: "indice1", indice2: "indice2", indication: "un indice", gameId: 1),
        Treasure(id: 3, name: "treasure3", latitude: 0.1, longitude:0.1, indice1: "indice1", indice2: "indice2", indication: "un indice", gameId: 1),
        Treasure(id: 4, name: "treasure4", latitude: 0.1, longitude:0.1, indice1: "indice1", indice2: "indice2", indication: "un indice", gameId: 1),
        Treasure(id: 5, name: "treasure5", latitude: 0.1, longitude:0.1, indice1: "indice1", indice2: "indice2", indication: "un indice", gameId: 1),
        Treasure(id: 6, name: "treasure6", latitude: 0.1, longitude:0.1, indice1: "indice1", indice2: "indice2", indication: "un indice", gameId: 1),
        Treasure(id: 7, name: "treasure7", latitude: 0.1, longitude:0.1, indice1: "indice1", indice2: "indice2", indication: "un indice", gameId: 1)
        
    ]
    
    
    
    func deleteTreasure(index: Int) {
        treasures.remove(at: index)
    }
}
