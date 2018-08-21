//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Mihaela Simion on 8/18/18.
//  Copyright © 2018 Mihaela Simion. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitute)
    }
    
    public var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    
    public var subtitle: String? {
        return category
    }
    
    var hasPhoto: Bool {
        return photoID != nil
    }
    
    var photoURL: URL {
        assert(photoID != nil, "No photo ID set")
        let fileName = "Photo-\(photoID!.intValue).jpg"
        return applicationDocumentsDirectory.appendingPathComponent(fileName)
    }
    
    var photoImage: UIImage? {
        return UIImage(contentsOfFile: photoURL.path)
    }

    static func nextPhotoID() -> Int {
    let userDefaults = UserDefaults.standard
        let currentID = userDefaults.integer(forKey: "PhotoID") + 1
        userDefaults.set(currentID, forKey: "PhotoID")
        userDefaults.synchronize()
        return currentID
    }
}
