//
//  Treasure.swift
//  TestCatApp
//
//  Created by Guenahele on 02/12/2022.
//

import Foundation
import MapKit

class Treasure: NSObject, Identifiable, MKAnnotation, Codable {

    var id : UUID
    var name: String
    var indication: String
    var clue1: String
    var clue2: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    internal init(name: String, indication: String, clue1: String, clue2: String,latitude: Double, longitude: Double) {
        self.id = UUID()
        self.name = name
        self.indication = indication
        self.clue1 = clue1
        self.clue2 = clue2
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static let example = Treasure(name: "Buckingham Palace", indication: "Where Queen Elizabeth lived with her dorgis", clue1 : "in the Palace", clue2 : "dogs", latitude: 51.501, longitude: -0.141)
}

