//
//  AppDelegate.swift
//  Stretchy
//
//  Created by na on 5.01.2023.
//

import UIKit
var rooter:Navigation?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setNavigation()
        return true
    }
    func setNavigation(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        rooter = Navigation(window: window!)
        rooter?.startApp()
    }

}

