//
//  ViewController.swift
//  DemoGoogleMaps
//
//  Created by Kenyi Rodriguez on 1/12/21.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak private var maps: GMSMapView!
    
    var startMarker = GMSMarker()
    var endMarker = GMSMarker()
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.startUpdatingLocation()
        self.configureMaps()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.goToUserLocation()
    }
    
    private func goToUserLocation() {
        guard let userLocation = self.locationManager.location?.coordinate else { return }
        self.goToCoordinate(userLocation)
    }
    
    private func configureMaps() {
        self.maps.settings.myLocationButton = true
        self.maps.settings.compassButton = true
        self.maps.isMyLocationEnabled = true
        self.maps.delegate = self
    }
    
    func goToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        let camera = GMSCameraPosition(target: coordinate, zoom: 16)
        self.maps.animate(to: camera)
    }
    
    func createMarkerAtCoordinate(_ coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
        marker.map = self.maps
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if self.startMarker.map == nil {
            self.startMarker.map = self.maps
            self.startMarker.position = coordinate
            self.startMarker.icon = UIImage(systemName: "bus")
            self.startMarker.isDraggable = true
            
        } else if self.endMarker.map == nil {
            
            self.endMarker.map = self.maps
            self.endMarker.position = coordinate
            self.endMarker.icon = UIImage(systemName: "person.fill")
            self.endMarker.isDraggable = true
        }
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
//        self.createMarkerAtCoordinate(coordinate)
    }
}

