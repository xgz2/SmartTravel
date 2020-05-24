//
//  AppDelegate.swift
//  SmartTravel
//
//  Created by George Zhuang on 12/28/19.
//  Copyright © 2019 George Zhuang. All rights reserved.
//

import Keys
import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let keys = SmartTravelKeys()
        GMSServices.provideAPIKey(keys.googleAPIKey)
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        
        return true
    }


}

