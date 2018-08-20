//
//  AppDelegate.swift
//  MyLocations
//
//  Created by Mihaela Simion on 8/14/18.
//  Copyright © 2018 Mihaela Simion. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var persistenContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Could not load data store: \(error)")
            }
        })
        return container
    } ()
    
    lazy var managedObjectContext: NSManagedObjectContext = self.persistenContainer.viewContext
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let tabController = window!.rootViewController as! UITabBarController
        if let tabViewControllers = tabController.viewControllers {
            var navController = tabViewControllers[0] as! UINavigationController
            let controller1 = navController.viewControllers.first as! CurrentLocationViewController
            controller1.managedObjectContext = managedObjectContext
            
            navController = tabViewControllers[1] as! UINavigationController
            let controller2 = navController.viewControllers.first as! LocationsViewController
            controller2.managedObjectContext = managedObjectContext
            let _ = controller2.view
            
            navController = tabViewControllers[2] as! UINavigationController
            let controller3 = navController.viewControllers.first as! MapViewController
            controller3.managedObjectContext = managedObjectContext
        }
        
        print(applicationDocumentsDirectory)
        listenForFatalCoreDataNotifications()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK:- Helper methods
    func listenForFatalCoreDataNotifications() {
        NotificationCenter.default.addObserver(
            forName: coreDataSaveFailedNotification,
            object: nil, queue: OperationQueue.main,
            using: { notification in
                let message = """
There was a fatal error in the app and it cannot continue.

Press OK to terminate the app. Sorry for the inconvenience.
"""
                let alert = UIAlertController(
                    title: "Internal Error", message: message,
                    preferredStyle: .alert)
                let action = UIAlertAction(title: "OK",
                                           style: .default) { _ in
                                            let exception = NSException(
                                                name: NSExceptionName.internalInconsistencyException,
                                                reason: "Fatal Core Data error", userInfo: nil)
                                            exception.raise()
                }
                alert.addAction(action)
                
                let tabController = self.window!.rootViewController!
                tabController.present(alert, animated: true,
                                      completion: nil)
        })
    }
}

