//
//  LocationCell.swift
//  MyLocations
//
//  Created by Mihaela Simion on 8/19/18.
//  Copyright © 2018 Mihaela Simion. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configure(for location: Location) {
        if location.locationDescription.isEmpty {
            descriptionLabel.text = "(No description)"
        } else {
            descriptionLabel.text = location.locationDescription
        }
        
        if let placemark = location.placemark {
            var text = ""
            if let s = placemark.subThoroughfare {
                text += s + " "
            }
            if let s = placemark.thoroughfare {
                text += s + ", "
            }
            if let s = placemark.locality {
                text += s
            }
            addressLabel.text = text
        } else {
            addressLabel.text = String(format: "Lat: %.8f, Long: %.8f", location.latitude, location.longitute)
        }
        
        photoImageView.image = thumbnail(for: location)
    }
    
    func thumbnail(for location: Location) -> UIImage {
        if location.hasPhoto, let image = location.photoImage {
            return image
        }
        return UIImage()
    }
}






