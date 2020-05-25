//
//  PlanViewController.swift
//  SmartTravel
//
//  Created by George Zhuang on 5/24/20.
//  Copyright © 2020 George Zhuang. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class PlanViewController: UIViewController, GMSMapViewDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    var mapView : GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pick a location"
        
        let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 12)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isTrafficEnabled = true
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.delegate = self
        self.view = mapView
    }
    
    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("\(coordinate.latitude) \(coordinate.longitude)")
    }

}
