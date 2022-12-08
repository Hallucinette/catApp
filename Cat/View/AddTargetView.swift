//
//  EditView.swift
//  TestCatApp
//
//  Created by Guenahele on 01/12/2022.
//

import SwiftUI
import MapKit

struct AddTargetView: View {
    
    @Binding var map : MKMapView
    @Binding var isShowingModal : Bool
    @Binding var treasures: [Treasure]
    
    
    
    @EnvironmentObject var addTargetVM : AddTargetViewModel
    
    func linkLocation(from a: CLLocationCoordinate2D, to b: CLLocationCoordinate2D) {
            let line = [a, b]
            let polyline = MKPolyline(coordinates: line, count: line.count)
            map.addOverlay(polyline)
        }
    
    var body: some View {
//
//                         "name": "tresorTest",
//                        "latitude": 48.864717,
//                        "longitude": 2.349018,
//                        "indication": "Ne checher pas trop loin il est                            planqué au centre",
//                        "indice1": "C'est pas dur j'ai dit au centre",
//                        "indice2": "Au centre !!!"
        NavigationView{
            Form {
                VStack{
                    Section{
                        TextField("Nom du Trésor", text: $addTargetVM.name)
                        TextField("Indication", text: $addTargetVM.indication)
                        TextField("Indice 1", text: $addTargetVM.clue1)
                        TextField("Indice 2", text: $addTargetVM.clue2)
                    }
                }
                .navigationTitle("Trésor")
                .toolbar {
                    
                    HStack {
                        Button("Annuler") {
                            if let treasure = addTargetVM.treasure {
                                let treasureCoordinate = CLLocationCoordinate2D(latitude: treasure.latitude, longitude: treasure.longitude)
                                if let annotation = map.annotations.first(where: {
                                    $0.coordinate.latitude == treasureCoordinate.latitude && $0.coordinate.longitude == treasureCoordinate.longitude
                                }) {
                                    map.removeAnnotation(annotation)
                                    isShowingModal.toggle()
                                }
                            }
                        }
                        Spacer()
                        
                        Button("Enregistrer") {

                            guard let newTreasure = addTargetVM.treasure else { return }
                            newTreasure.name = addTargetVM.name
                            newTreasure.indication = addTargetVM.indication
                            newTreasure.clue1 = addTargetVM.clue1
                            newTreasure.clue2 = addTargetVM.clue2
                            if let treasure = addTargetVM.treasure {
                                let treasureCoordinate = CLLocationCoordinate2D(latitude: treasure.latitude, longitude: treasure.longitude)
                                
                                var firstTreasure = Treasure(name: treasure.name, indication: treasure.indication, clue1: treasure.clue1, clue2: treasure.clue2, latitude: treasure.latitude, longitude: treasure.longitude)
                                
                                treasures.append(firstTreasure)
                                
                                if let index = map.annotations.firstIndex(where: {
                                    $0.coordinate.latitude == treasureCoordinate.latitude && $0.coordinate.longitude == treasureCoordinate.longitude
                                }) {
                                    (map.annotations[index] as? MKPointAnnotation)?.title = treasure.name
                                    isShowingModal.toggle()
                                }
                            }
                            
                            let pointAnnotations = map.annotations.compactMap { $0 as? MKPointAnnotation
                            }
                            
                            let annotations = pointAnnotations.filter {
                                if let title = $0.title { return !title.isEmpty }
                                return true
                            }
                            
                            if annotations.count == 3 {
                                
                                let firstLocation = annotations[0].coordinate
                                let secondLocation = annotations[1].coordinate
                                let thirdLocation = annotations[2].coordinate
                                
                                linkLocation(from: firstLocation, to: secondLocation)
                                linkLocation(from: firstLocation, to: thirdLocation)
                                linkLocation(from: secondLocation, to: thirdLocation)
                            }
                        }
                    }
                }
                .onAppear {
                    addTargetVM.name = ""
                    addTargetVM.indication = ""
                    addTargetVM.clue1 = ""
                    addTargetVM.clue2 = ""
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        AddTargetView(map: .constant(MKMapView()), isShowingModal: .constant(false), treasures: .constant([Treasure(name: "", indication: "", clue1: "", clue2: "", latitude: 0, longitude: 0)]))
            .environmentObject(AddTargetViewModel())
    }
}
