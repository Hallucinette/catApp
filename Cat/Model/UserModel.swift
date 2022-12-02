//
//  UserModel.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import Foundation

struct User: Identifiable {
    var id: Int
    var mail: String
    var pseudo: String
    var totPoint: Int
    var gameCounter: Int
}
