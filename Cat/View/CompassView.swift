//
//  CompassView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 05/12/2022.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var compassHeading = CompassHeading()
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 5,
                       height: 50)
            ZStack {
                ForEach(Marker.markers(), id: \.self) { marker in
                    CompassMarkerView(marker: marker,
                                      compassDegress: 0)
                }
            }
            .rotationEffect(Angle(degrees: self.compassHeading.degrees))
            .frame(width: 300,
                   height: 300)
            .rotationEffect(Angle(degrees: 0))
            .statusBar(hidden: true)
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
