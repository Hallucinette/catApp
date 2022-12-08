//
//  MKCoordinateRegion+Extensions.swift
//  TestCatApp
//
//  Created by Guenahele on 30/11/2022.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static func defaultRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.864716, longitude:2.349014), span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
    }
    
    static func regionFromTreasure(_ treasure : Treasure) -> MKCoordinateRegion {
        MKCoordinateRegion(center: treasure.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

