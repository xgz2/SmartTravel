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
    
    var locations = [Location]()
    var tripTableView: UITableView!
    let cellHeight: CGFloat = 68
    var cell: LocationTableViewCell?
    let reuseIdentifier = "locationCellReuse"
    var thePath: IndexPath?
    
    var displayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
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
        
        tripTableView = UITableView()
        tripTableView.dataSource = self
        tripTableView.delegate = self
        tripTableView.translatesAutoresizingMaskIntoConstraints = false
        tripTableView.register(LocationTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tripTableView.layer.borderColor = UIColor.systemBlue.cgColor
        tripTableView.layer.borderWidth = 1
        tripTableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        view.addSubview(tripTableView)
        
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
            tripTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tripTableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
            tripTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            tripTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tripTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}

extension ViewController: AddLocationDelegate {
    func addLocation(to newLocation: CLLocationCoordinate2D) {
        let geocoder = GMSGeocoder()
        var address = "Unfound"
        geocoder.reverseGeocodeCoordinate(newLocation, completionHandler: {
            (response, error) in
            if let error = error {
                print(error)
            }
            address = response?.firstResult()?.thoroughfare ?? address
            self.locations.append(Location(address: address, latitude: newLocation.latitude, longitude: newLocation.longitude))
            self.tripTableView.reloadData()
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationTableViewCell
        let location = locations[indexPath.row]
        cell.configure(for: location)
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
