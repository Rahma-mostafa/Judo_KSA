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
import FirebaseFirestore

class MapVC: BaseController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var latitude: Double = 29.97648
    var longitude: Double = 31.131302
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setLocation()
//        cameraZomRange()
       
    }
    func setup(){
          self.hiddenNav = false
          locationManager.requestAlwaysAuthorization()
          locationManager.startUpdatingLocation()
          locationManager.delegate = self

    }

    func setLocation(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("location").getDocuments() { [self] (querySnapshot, err) in
            print("connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    self.latitude = document["latitude"] as? Double ?? 29.97648
                    self.longitude = document["longitude"] as? Double ?? 31.131302
                    let initialLocation = CLLocation(latitude: latitude , longitude: longitude)
                    mapView.centerToLocation(initialLocation)


                }
                self.activityIndicator.stopAnimating()

            }
        }
    }



       
    @IBAction func onCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
    
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
  

