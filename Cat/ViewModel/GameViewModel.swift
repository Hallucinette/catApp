//
//  GameViewModel.swift
//  Cat
//
//  Created by Esteban SEMELLIER on 07/12/2022.
//

import SwiftUI

class GameViewModel : ObservableObject {
    @Published var game: Game = Game(id: 1, name: "", code: "", treasures: [Treasure(name: "", indication: "", clue1: "", clue2: "", latitude: 2.2, longitude: 2.2)], userId: UserDefaults.standard.integer(forKey: "userId"))
    @Published var games: [String] = ["Vous n'avez pas encore de parties enregistrées"]
    @Published var supress: Bool = false
    var baseUrl = "http://localhost:8080"
    
    
    // - MARK: Fonction POST Game
    func CreateGame(name: String) async throws -> (Game) {
        guard let url = URL(string: "\(baseUrl)/games/index")
        else {
            fatalError("Missing game URL")
        }
        
        let body: [String: String] = [
                    "name": name,
                    "userId": UserDefaults.standard.string(forKey: "userId")!
                    
         ]
        
        let keychainItem = KeychainItem(service: "com.ameliepocchiolo.Cat", account: "accessToken")
        var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "POST"
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                urlRequest.addValue(try keychainItem.readItem(), forHTTPHeaderField: "x-access-token")
        // let json = try JSONSerialization.jsonObject(with: body, options: []) as? [String: Any]
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedGame = try decoder.decode(Game.self, from: data)
        
        print("succes: \(decodedGame)")
        return decodedGame
        
    }

    

}

