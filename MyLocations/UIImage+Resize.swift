//
//  UIImage+Resize.swift
//  MyLocations
//
//  Created by Mihaela Simion on 8/21/18.
//  Copyright © 2018 Mihaela Simion. All rights reserved.
//

import UIKit

extension UIImage {
    func resized(withBounds bounds: CGSize) -> UIImage {
        let horizontalRatio = bounds.width / size.width
        let verticalRation = bounds.height / size.height
        let ratio = min(horizontalRatio, verticalRation)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
