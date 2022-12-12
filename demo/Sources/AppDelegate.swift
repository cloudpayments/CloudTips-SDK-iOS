//
//  AppDelegate.swift
//  Cloudtips-SDK-iOS-Demo
//
//  Created by Sergey Iskhakov on 29.09.2020.
//

import UIKit
import Cloudtips

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        do {
            let yaAppId = "1193a702-d3c0-4637-a7c0-2ac95b73ee29"
            try CloudtipsSDK.initialize(yandexPayAppId: yaAppId, sandboxMode: true)
        } catch {
            fatalError("Unable to initialize CloudtipsSDK.")
        }

        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        CloudtipsSDK.instance.applicationDidReceiveUserActivity(userActivity)
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        CloudtipsSDK.instance.applicationDidReceiveOpen(url, sourceApplication: options[.sourceApplication] as? String)
        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        CloudtipsSDK.instance.applicationWillEnterForeground()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        CloudtipsSDK.instance.applicationDidBecomeActive()
    }
    
}

