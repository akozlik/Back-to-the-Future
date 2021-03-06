//
//  AppDelegate.swift
//  BackToTheFuture
//
//  Created by Andrew Kozlik on 10/19/15.
//  Copyright (c) 2015 Andrew Kozlik. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }

    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        if (shortcutItem.type == "com.codefortravel.backtothefuture.fluxcapacitor") {
            let VC = getRootController() as! ViewController
            VC.switchTimeTravelButtonLabel()
        } else if (shortcutItem.type == "com.codefortravel.backtothefuture.character") {
            let characterName = shortcutItem.userInfo!["characterName"] as? String
            let VC = getRootController() as! ViewController
            VC.loadDetailForCharacter(characterName!)

        }
    }
    
    func getRootController() -> UIViewController? {
        let navVC = self.window?.rootViewController as? UINavigationController
        let VCs = navVC?.viewControllers as [UIViewController]?
        
        if (VCs?.count > 0) {
            let VC = VCs![0] as! ViewController
            return VC
        }
        
        return nil
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.codefororlando.BackToTheFuture" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
    }()

}

