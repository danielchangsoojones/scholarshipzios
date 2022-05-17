//
//  AppDelegate.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/13/22.
//

import UIKit
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUpServer()
        setStartingVC()
        return true
    }
    
    // set orientations you want to be allowed in this property by default
    var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    
    private func setUpServer() {
        let configuration = ParseClientConfiguration {
            $0.applicationId = Configuration.environment.appID
            $0.server = Configuration.environment.serverURL
        }
        
        Parse.initialize(with: configuration)
        InfluencerParse.registerSubclass()
        StoreItemParse.registerSubclass()
        StorePhotoParse.registerSubclass()
        
        //configure Stripe
//        STPAPIClient.shared.publishableKey = Configuration.environment.stripePublishableKey
    }
}

extension AppDelegate {
    private func setStartingVC() {
        let vc = ExploreViewController()
        let navController = UINavigationController(rootViewController: vc)
        set(startingVC: navController)
    }
    
    private func set(startingVC: UIViewController) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = startingVC
        self.window?.makeKeyAndVisible()
    }
}

