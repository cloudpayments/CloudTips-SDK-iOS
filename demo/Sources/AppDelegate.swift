//
//  AppDelegate.swift
//  Cloudtips-SDK-iOS-Demo
//
//  Created by Sergey Iskhakov on 29.09.2020.
//

import UIKit
import CloudtipsSDK
//import YandexPaySDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        do {
            let yaAppId = "1193a702-d3c0-4637-a7c0-2ac95b73ee29"
            try Cloudtips.initialize(yandexPayAppId: yaAppId, sandboxMode: true)

                // Укажите конфигурацию
//            let merchant = YandexPaySDKMerchant(
//                // ID продавца в системе YandexPay
//                id: "1193a702-d3c0-4637-a7c0-2ac95b73ee29",
//                // Имя продавца
//                name: "cloudpayments",
//                // URL продавца
//                url: "https://cloudtips.ru"
//            )
//
//            let configuration = YandexPaySDKConfiguration(
//                // Необходимое окружение
//                environment: .sandbox,
//                // Информация о мерчанте
//                merchant: merchant,
//                // Локализация
//                locale: .ru
//            )
//                // Инициализируйте SDK
//            try YandexPaySDKApi.initialize(configuration: configuration)

        } catch {
            fatalError("Unable to initialize CloudtipsSDK.")
        }

        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        Cloudtips.instance.applicationDidReceiveUserActivity(userActivity)
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        Cloudtips.instance.applicationDidReceiveOpen(url, sourceApplication: options[.sourceApplication] as? String)
        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        Cloudtips.instance.applicationWillEnterForeground()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        Cloudtips.instance.applicationDidBecomeActive()
    }
    
}

