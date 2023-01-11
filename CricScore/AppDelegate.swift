//
//  AppDelegate.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 28/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        showHome()
        
        return true
    }
    
    
    func getStoryBoard()-> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }

    func showHome()  {

        let navController = getStoryBoard().instantiateViewController(withIdentifier: "SummaryNavigationVC") as? UINavigationController
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        print("User is Active !!")

    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
        PreferenceManager.shared.resetDefaults()
    }
    

}

