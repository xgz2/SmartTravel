//
//  ViewController.swift
//  SmartTravel
//
//  Created by George Zhuang on 12/28/19.
//  Copyright © 2019 George Zhuang. All rights reserved.
//

import UIKit
import GoogleMaps

protocol AddLocationDelegate: class  {
    func addLocation(to newLocation: CLLocationCoordinate2D)
}

class ViewController: UIViewController {

    var addButton: UIButton!
    var locationList : Dictionary<Double, Double> = [:]
    var displayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plan your trip"
        view.backgroundColor = .white

        
        addButton = UIButton()
        addButton.backgroundColor = .white
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.setTitle("Plan Trip", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.layer.borderWidth = 1
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        view.addSubview(addButton)
        
        displayTextView = UITextView()
        displayTextView.translatesAutoresizingMaskIntoConstraints = false
        displayTextView.isEditable = false
        displayTextView.layer.borderColor = UIColor.systemBlue.cgColor
        displayTextView.layer.borderWidth = 1
        displayTextView.textColor = .black
        view.addSubview(displayTextView)
        
        setupConstraints()
    }

    @objc func addButtonPressed() {
        let viewController = PlanViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            displayTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayTextView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
            displayTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            displayTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            displayTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}

extension ViewController: AddLocationDelegate {
    func addLocation(to newLocation: CLLocationCoordinate2D) {
        locationList[newLocation.latitude] = newLocation.longitude
        var text = ""
        for (lat, long) in locationList {
            text = text + ("\n\(lat) \(long)")
        }
        displayTextView.text = text
    }
}
