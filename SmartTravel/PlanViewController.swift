//
//  PlanViewController.swift
//  SmartTravel
//
//  Created by George Zhuang on 5/24/20.
//  Copyright © 2020 George Zhuang. All rights reserved.
//

import UIKit
import GoogleMaps

class PlanViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var mapView : GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plan a Trip"
        view.backgroundColor = .red
        
        let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 9)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        
        
    }

}
