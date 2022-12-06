//
//  UserModel.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 30/11/2022.
//

import Foundation


struct User: Identifiable, Codable, Equatable {

    var id: Int
    var email: String
    var newEmail: String?
    var password: String
    var newPassword: String?
    var pseudo: String
    var totPoint: Int
    var gameCounter: Int
}
