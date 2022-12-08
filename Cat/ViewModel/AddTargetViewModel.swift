//
//  AddTargetViewModel.swift
//  TestCatApp
//
//  Created by Guenahele on 02/12/2022.
//

import SwiftUI


class AddTargetViewModel : ObservableObject {
    internal init(name: String = "", indication: String = "", clue1: String = "", clue2: String = "", treasure: Treasure? = nil, onSave: @escaping (Treasure) -> () = {_ in }) {
        self.name = name
        self.indication = indication
        self.clue1 = clue1
        self.clue2 = clue2
        self.treasure = treasure
        self.onSave = onSave
    }
    
    
    @Published  var name: String = ""
    @Published  var indication: String = ""
    @Published  var clue1: String = ""
    @Published  var clue2: String = ""
    
    @Published var treasure: Treasure?
 
    
    var onSave: (Treasure) -> () = {_ in }
    
    func createTreasure () {
        
    }
}
