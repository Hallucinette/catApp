//
//  DataModel.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import Foundation


struct User {
    var id: Int
    var mail: String
    var pseudo: String?
    var totPoint: Int
    var gameCounter: Int
}

struct Partipant {
    var id: Int
    var userId: Int
    var gameId: Int
    var isPlaying: Bool
    
}

struct Game {
    var id: Int
    var code: [Character]
    var userId: Int //l'user qui cree la partie
}

struct MapPoint {
    var id: Int
    var latitude: CGFloat
    var longitude: CGFloat
    var gameId: Int
}

struct Treasure {
    var id: Int
    var point: Int = 5
    var name: String
    var latitude: CGFloat
    var longitude: CGFloat
    var indice1: String
    var indice2: String
    var indication: String
    var gameId: Int
    var indiceIsActived1: Bool = false
    var indiceIsActived2: Bool = false
    var compassIsActived: Bool = false
}
