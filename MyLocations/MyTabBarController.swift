//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Mihaela Simion on 8/21/18.
//  Copyright © 2018 Mihaela Simion. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return nil
    }
}
