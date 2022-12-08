//
//  Map.swift
//  TestCatApp
//
//  Created by Guenahele on 01/12/2022.
//


import Foundation
import MapKit
import SwiftUI

struct Map: UIViewRepresentable {
    
     typealias UIViewType = MKMapView
    
    @ObservedObject var addTargetVM : AddTargetViewModel
    @Binding var isShowingModal : Bool
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude : 2.3522219), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @Binding var myMapView: MKMapView
//    @State private var region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 48.864716, longitude:2.349014),
//            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
//        )
    
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: Map
        
        let sfCoord = CLLocationCoordinate2D(latitude: 48.856614, longitude:2.3522219)
        
        init(_ control: Map) {
            self.parent = control
        }
        // fonction pour focaliser la vue sur la localisation d'User
        func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
            if let annotationView = views.first {
                if let annotation = annotationView.annotation {
                    if annotation is MKUserLocation {
                        let regionMapView = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                        mapView.setRegion(regionMapView, animated: true)
                    }
                }
            }
        }
        
        // fonction pour lancer l'affichage de la zone de jeu
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
                    if overlay.isKind(of: MKPolyline.self) {
                        // draw the track
                        let polyLine = overlay
                        let polyLineRenderer = MKPolylineRenderer(overlay: polyLine)
                        polyLineRenderer.strokeColor = UIColor.orange
                        polyLineRenderer.lineWidth = 2.0

                        return polyLineRenderer
                    }

                    return MKPolylineRenderer()
                }
        
        // fonction pour ajouter des Treasures
        @objc func addAnnotationOnTapGesture(sender: UITapGestureRecognizer) {
            if sender.state == .ended {
                print("in addAnnotationOnTapGesture")
                let point = sender.location(in: parent.myMapView)
                print("point is \(point)")
                let coordinate = parent.myMapView.convert(point, toCoordinateFrom: parent.myMapView)
                print("coordinate?.latitude is \(String(describing: coordinate.latitude))")
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = parent.addTargetVM.name
                parent.myMapView.addAnnotation(annotation)
                parent.isShowingModal.toggle()
                let newTreasure = Treasure(name: parent.addTargetVM.name, indication: parent.addTargetVM.indication, clue1 : parent.addTargetVM.clue1, clue2 : parent.addTargetVM.clue2, latitude: coordinate.latitude, longitude : coordinate.longitude)
                parent.addTargetVM.treasure = newTreasure
            }
        }
    }//coord
    func makeUIView(context: Context) -> MKMapView {
            let map = MKMapView()
            map.showsUserLocation = true
            map.delegate = context.coordinator
        
            DispatchQueue.main.async {
                self.myMapView = map
            }
        
            let gRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.addAnnotationOnTapGesture(sender:)))
            map.addGestureRecognizer(gRecognizer)

            return map
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func updateUIView(_ uiView: MKMapView, context: Context) {

        }
}
