//
//  UserViewModel.swift
//  Cat
//
//  Created by Mahdia Amriou on 30/11/2022.
//

import Foundation

class UserViewModel: ObservableObject {
    
    
 
    @Published var users: [User] = [
        
        User(id: 1, mail: "user1@mail.com", pseudo: "Sandra", totPoint: 0, gameCounter: 10),
        User(id: 2, mail: "user2@mail.com", pseudo: "Lili", totPoint: 0, gameCounter: 10),
        User(id: 3, mail: "user3@mail.com", pseudo: "Coucou", totPoint: 0, gameCounter: 10),
        User(id: 4, mail: "user4@mail.com", pseudo: "Sara", totPoint: 0, gameCounter: 10),
        User(id: 5, mail: "user5@mail.com", pseudo: "Loulou", totPoint: 0, gameCounter: 10),
        User(id: 6, mail: "user6@mail.com", pseudo: "Minou", totPoint: 0, gameCounter: 10),
        User(id: 7, mail: "user7@mail.com", pseudo: "Alpha", totPoint: 0, gameCounter: 10),
        User(id: 8, mail: "user8@mail.com", pseudo: "Beta", totPoint: 0, gameCounter: 10),
        User(id: 9, mail: "user9@mail.com", pseudo: "Gamma", totPoint: 0, gameCounter: 10),
        User(id: 10, mail:"user10@mail.com", pseudo: "kikou", totPoint: 0, gameCounter: 10)
       
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
   
    
    
    
    
    
 //  var endPoint = "https://"
    
    
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
