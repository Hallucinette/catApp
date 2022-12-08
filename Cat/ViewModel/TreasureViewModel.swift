//
//  TreasureListViewModel.swift
//  Cat
//
//  Created by Mahdia Amriou on 05/12/2022.
//

import Foundation
class TreasureViewModel: ObservableObject {
    
    
    
    @Published var treasures: [Treasure] = [
        
       
        
        Treasure(/*id: 1,*/ name: "treasure1", indication: "un indice", clue1: "indice1", clue2: "indice2",  latitude: 0.1, longitude:0.1 /*,gameId: 1*/),
        Treasure(/*id: 2,*/ name: "treasure2", indication: "un indice", clue1: "indice1", clue2: "indice2",  latitude: 0.1, longitude:0.1 /*,gameId: 1*/),
        Treasure(/*id: 3,*/ name: "treasure3", indication: "un indice", clue1: "indice1", clue2: "indice2",  latitude: 0.1, longitude:0.1 /*,gameId: 1*/),
        Treasure(/*id: 4,*/ name: "treasure4", indication: "un indice", clue1: "indice1", clue2: "indice2",  latitude: 0.1, longitude:0.1 /*,gameId: 1*/),
        Treasure(/*id: 5,*/ name: "treasure5", indication: "un indice", clue1: "indice1", clue2: "indice2",  latitude: 0.1, longitude:0.1 /*,gameId: 1*/),
        Treasure(/*id: 6,*/ name: "treasure6", indication: "un indice", clue1: "indice1", clue2: "indice2",  latitude: 0.1, longitude:0.1 /*,gameId: 1*/),
        Treasure(/*id: 7,*/ name: "treasure7", indication: "un indice", clue1: "indice1", clue2: "indice2",  latitude: 0.1, longitude:0.1 /*,gameId: 1*/)
        
    ]
    
    
    
    func deleteTreasure(index: Int) {
        treasures.remove(at: index)
    }
}
