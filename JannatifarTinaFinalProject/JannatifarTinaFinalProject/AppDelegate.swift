//
//  AppDelegate.swift
//  JannatifarTinaFinalProject
//
//  Created by mahta 96 on 12/5/22.
//

import UIKit
import Firebase
import GooglePlaces
import MapKit
import CoreLocation
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //i have used firebase to we have to configure it here
        FirebaseApp.configure()
        //this is beause we have added google places api
        GMSPlacesClient.provideAPIKey("AIzaSyBuMBXeiC5yjjNqVyYVSc3BMrV9bXXBt5c")
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

