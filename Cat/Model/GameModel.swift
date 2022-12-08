//
//  GameModel.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import Foundation

struct Game: Identifiable, Codable {
    var id: Int
    var name: String
    var code: String
    var treasures: [Treasure]
    var userId: Int //l'user qui cree la partie
}



