//
//  CompassMarkerView.swift
//  Cat
//
//  Created by Amelie Pocchiolo on 05/12/2022.
//

import SwiftUI

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegress: Double
   // @ObservedObject var compassHeading = CompassHeading()

    var body: some View {
        VStack {
            Text(marker.degreeText())
                    .fontWeight(.light)
                    .rotationEffect(self.textAngle())

            Capsule()
                    .frame(width: self.capsuleWidth(),
                            height: self.capsuleHeight())
                    .foregroundColor(self.capsuleColor())
                    .padding(.bottom, 120)

            Text(marker.label)
                    .fontWeight(.bold)
                    .rotationEffect(self.textAngle())
                    .padding(.bottom, 80)
        }.rotationEffect(Angle(degrees: marker.degrees))
    }
    
    private func capsuleWidth() -> CGFloat {
        return self.marker.degrees == 0 ? 7 : 3
    }
    
    private func capsuleHeight() -> CGFloat {
        return self.marker.degrees == 0 ? 45 : 30
    }
    
    private func capsuleColor() -> Color {
        return self.marker.degrees == 0 ? .red : .gray
    }
    
    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegress - self.marker.degrees)
    }
}

struct CompassMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        CompassMarkerView(marker: Marker(degrees: 0), compassDegress: 0)
    }
}
