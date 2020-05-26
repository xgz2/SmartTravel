//
//  LocationTableViewCell.swift
//  SmartTravel
//
//  Created by George Zhuang on 5/26/20.
//  Copyright © 2020 George Zhuang. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    var addressLabel: UILabel!
    var longitudeLabel: UILabel!
    var latitudeLabel: UILabel!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 16
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addressLabel = UILabel()
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(addressLabel)
        
        latitudeLabel = UILabel()
        latitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        latitudeLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(latitudeLabel)
        
        longitudeLabel = UILabel()
        longitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        longitudeLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(longitudeLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
        ])
        NSLayoutConstraint.activate([
            latitudeLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor),
            latitudeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 2)
        ])
        NSLayoutConstraint.activate([
            longitudeLabel.leadingAnchor.constraint(equalTo: latitudeLabel.leadingAnchor),
            longitudeLabel.topAnchor.constraint(equalTo: latitudeLabel.bottomAnchor, constant: 2)
        ])
    }
    
    func configure(for location: Location) {
        addressLabel.text = location.address
        latitudeLabel.text = String(location.latitude)
        longitudeLabel.text = String(location.longitude)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
