//
//  SignInResponse.swift
//  Cat
//
//  Created by Esteban SEMELLIER on 07/12/2022.
//

import Foundation
import Foundation

struct SignInResponse: Identifiable, Codable {
    var id: Int
    var email: String
    var roles: [String]
    var accessToken: String
}


/*
 {
     "id": 1,
     "email": "user1@test.com",
     "roles": [
         "ROLE_USER"
     ],
     "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjY4Nzg0Mzg1LCJleHAiOjE2Njg4NzA3ODV9.NR3jauEa-pYHOSROSy5biYOCg3B45Tx9xRuxOFOzzJk"
 }
 */
