//
//  MapVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/12/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        mapView.centerToLocation(initialLocation)
//        cameraZoomRange()
       
    }
    // Set initial location
    let initialLocation = CLLocation(latitude: 29.976480 , longitude: 31.131302)
//    func cameraZoomRange(){
//           let oahuCenter = CLLocation(l          atitude: 29.976480, longitude: 31.131302)
//                  let region = MKCoordinateRegion(
//                    center: oahuCenter.coordinate,
//                    latitudinalMeters: 50000,
//                    longitudinalMeters: 60000)
//                  mapView.setCameraBoundary(
//                    MKMapView.CameraBoundary(coordinateRegion: region),
//                    animated: true)
//
//                  let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
//                  mapView.setCameraZoomRange(zoomRange, animated: true)
//       }
    
}
private extension MKMapView {
    func centerToLocation(
      _ location: CLLocation,
      regionRadius: CLLocationDistance = 1000
    ) {
      let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: regionRadius,
        longitudinalMeters: regionRadius)
      setRegion(coordinateRegion, animated: true)
    }
  }
  

