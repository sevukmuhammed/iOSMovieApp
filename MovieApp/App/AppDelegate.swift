//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import UIKit
import Swinject
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    internal var appCoordinator: AppCoordinator!
    internal var container = Container()
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.initDependencyGraph()
        
        return true
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        appCoordinator = AppCoordinator(window: window!, container: container)
        appCoordinator.start(AppMainScene.app, data: [])
        window?.makeKeyAndVisible()
        return true
    }

}

