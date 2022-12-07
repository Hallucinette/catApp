//
//  UserVM.swift
//  Cat
//
//  Created by Esteban SEMELLIER on 06/12/2022.
//

import SwiftUI

extension UserViewModel {
    
    
    // MARK: - SIGNUP
    func signUp(sendEmail: String, sendPassword: String) async throws -> (User) {
        
        // MARK: - URL DE LA REQUEST
        guard let url = URL(string: "http://localhost:8080/api/auth/signup" )
        else {
            fatalError("Missing URL")
        }
        
        // MARK: - CREATION DE L'OBJET USER
        let body: [String: String] = ["email" : sendEmail,
                                      "password": sendPassword]
        
        print(email + " " + password)
        // MARK: - ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let user = try decoder.decode(User.self, from: data)
        
        print("succes: \(user)")
        return user
    }
    
    // MARK: - SIGNIN
    func signIn(email: String, password: String ) async throws -> (SignInResponse) {
        
        // MARK: - URL DE LA REQUEST
        guard let url = URL(string: "http://localhost:8080/api/auth/signin")
        else {
            fatalError("Missing URL")
        }
        
        // MARK: - CREATION DES PARAMETRES DE LA REQUÊTE
        let body: [String: String] = ["email" : email,
                                      "password" : password]
        
        // MARK: - ENVOI DE LA REQUETE SUR LE SERVER
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(SignInResponse.self, from: data)
        
        print("succes: \(response.accessToken)")
        let keychainItem = KeychainItem(service: "com.ameliepocchiolo.Cat", account: "accessToken")
        try keychainItem.saveItem(response.accessToken)
        UserDefaults.standard.set(response.id, forKey: "UserId")
        return response
        
    }
    
    // MARK: - GET USER INFO
    func getUser() async throws -> (User) {
        guard let url = URL(string: "\(baseUrl)/\(user.id)")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let user = try decoder.decode(User.self, from: data)
       
        
        print("succes: \(user)")
        return user
    }
    
}
