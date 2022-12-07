//
//  UserViewModel.swift
//  Cat
//
//  Created by Mahdia Amriou on 30/11/2022.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var pseudo = ""
    @Published var email = ""
    @Published var repeatEmail = ""
    @Published var password = ""
    @Published var newPassword = ""
    @Published var isConnected = false
    
    @Published var user: User = User(id: 1, email: "test@test.com", password: "123", pseudo: "arktik", totPoint: 0, gameCounter: 0)
    
    @Published var users: [User] = [
        
        User(id: 1, email: "user1@mail.com",password: "123", pseudo: "Sandra", totPoint: 0, gameCounter: 10),
        User(id: 2, email: "user2@mail.com",password: "123", pseudo: "Lili", totPoint: 0, gameCounter: 10),
        User(id: 3, email: "user3@mail.com",password: "123", pseudo: "Coucou", totPoint: 0, gameCounter: 10),
        User(id: 4, email: "user4@mail.com",password: "123", pseudo: "Sara", totPoint: 0, gameCounter: 10),
        User(id: 5, email: "user5@mail.com",password: "123", pseudo: "Loulou", totPoint: 0, gameCounter: 10),
        User(id: 6, email: "user6@mail.com",password: "123", pseudo: "Minou", totPoint: 0, gameCounter: 10),
        User(id: 7, email: "user7@mail.com",password: "123", pseudo: "Alpha", totPoint: 0, gameCounter: 10),
        User(id: 8, email: "user8@mail.com",password: "123", pseudo: "Beta", totPoint: 0, gameCounter: 10),
        User(id: 9, email: "user9@mail.com",password: "123", pseudo: "Gamma", totPoint: 0, gameCounter: 10),
        User(id: 10, email:"user10@mail.com",password: "123", pseudo: "kikou", totPoint: 0, gameCounter: 10)
       
    ]
    
    //Pour le tri d'un tableau odredre croissant: on peut utiliser soit la fonction ou la variable calculé
    //    func sortedUsersByPoint() -> [User] {
 //       return users.sorted(by: { $0.totPoint > $1.totPoint})
 //   }
    
  //  @Published var sortedUsers: [User]
   
   var sortedUsers: [User] {
    return users.sorted(by: { $0.totPoint > $1.totPoint})
    }
    
    func deleteUser(index: Int) {
        users.remove(at: index)
    }
   
    // Urls pour l'API
   var baseUrl = "http://localhost:8080"
    var endPointSignIn = "/api/auth/signin"
    var endPointSignUp = ")/api/auth/signup"
    
    // - MARK: Fonction READ
   // func getUserFromApi() async throws -> ([User]) {
      //  guard let url = URL(string: "\(endPoint)/users")
       // else {
      //      fatalError("Missing URL")
    //    }
    //    var urlRequest = URLRequest(url: url)
    //    urlRequest.httpMethod = "GET"
     //   let (data, response) = try await URLSession.shared.data(for: urlRequest)
     //   guard (response as? HTTPURLResponse)?.statusCode == 200
     //   else {
      //      fatalError("Error while fetching data")
     //   }
     //   let decoder = JSONDecoder()
     //   decoder.keyDecodingStrategy = .convertFromSnakeCase
      //  let users = try decoder.decode([User].self, from: data)
        
    //    print("succes: \(users)")
     //   return users
        
    }
    
    
//}
