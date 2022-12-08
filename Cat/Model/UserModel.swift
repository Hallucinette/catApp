//
//  UserModel.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import Foundation


struct User: Identifiable, Codable {

    var id: Int
    var email: String
    var password: String
    var pseudo: String
    var totPoint: Int
    var gameCounter: Int
    var iscreator = false
}

struct UserResponse: Identifiable, Codable {
    
    var id: Int
    var email: String
    var totalPoints: Int
    var gameCount: Int
    var createdAt: String
}

