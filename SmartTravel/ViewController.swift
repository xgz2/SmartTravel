//
//  ViewController.swift
//  SmartTravel
//
//  Created by George Zhuang on 12/28/19.
//  Copyright © 2019 George Zhuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var planButton: UIButton!
    var funButton: UIButton!
    var creditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SmartTravel Index"
        
        view.backgroundColor = .white
        planButton = UIButton()
        planButton.backgroundColor = .white
        planButton.addTarget(self, action: #selector(planButtonPressed), for: .touchUpInside)
        planButton.setTitle("Plan Trip", for: .normal)
        planButton.setTitleColor(.systemBlue, for: .normal)
        planButton.layer.borderColor = UIColor.systemBlue.cgColor
        planButton.layer.borderWidth = 1
        planButton.translatesAutoresizingMaskIntoConstraints = false
        planButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        view.addSubview(planButton)
        
        setupConstraints()
    }

    @objc func planButtonPressed() {
        let viewController = PlanViewController()
        navigationController?.pushViewController(viewController, animated: true)
        print("A")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            planButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
    }
}
