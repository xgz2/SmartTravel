//
//  Location.swift
//  SmartTravel
//
//  Created by George Zhuang on 5/26/20.
//  Copyright © 2020 George Zhuang. All rights reserved.
//

import Foundation

class Location {
    var address: String
    var latitude: Double
    var longitude: Double
    
    init(address: String, latitude: Double, longitude: Double) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func setAddress(to address: String) {
        self.address = address
    }
    func setLatitude(to latitude: Double) {
        self.latitude = latitude
    }
    func setLongitude(to longitude: Double) {
        self.longitude = longitude
    }
}
