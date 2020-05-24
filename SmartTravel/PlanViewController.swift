//
//  PlanViewController.swift
//  SmartTravel
//
//  Created by George Zhuang on 5/24/20.
//  Copyright © 2020 George Zhuang. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var back: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plan a Trip"
        view.backgroundColor = .red
        
    }

}