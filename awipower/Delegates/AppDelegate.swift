//
//  AppDelegate.swift
//  awipower
//
//  Created by Srajan on 20/10/20.
//

import UIKit
import GoogleSignIn
import FacebookCore
import FacebookLogin
@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        if #available(iOS 13.0, *) {
//            // Always adopt a light interface style.
//            window?.overrideUserInterfaceStyle = .light
//            Thread.sleep(forTimeInterval: 2)
//        }
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        GIDSignIn.sharedInstance().clientID = "472812304753-726u5gnvnvonjino3rauolhj4r4fpihh.apps.googleusercontent.com"
       let device_id =  UIDevice.current.identifierForVendor!.uuidString
        
        #if DEBUG
        print(device_id)
        #endif
        UserDefaults.standard.set(device_id, forKey:"device_id")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

