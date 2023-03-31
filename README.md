# Cloudtips SDK for iOS 

Cloudtips SDK позволяет интегрировать прием чаевых в мобильные приложение для платформы iOS.

### Требования
Для работы Cloudtips SDK необходим iOS версии 12.0 и выше.

### Подключение

#### Swift Package Manager
https://github.com/cloudpayments/CloudTips-SDK-iOS

### Структура проекта:

* **demo** - Пример реализации приложения с использованием SDK
* **Frameworks** - Двоичные библиотеки, необходимые для работы SDK

## Инициализация CloudtipsSDK

В Info.plist файле добавьте:

```
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>tinkoffbank</string>
</array>
```

В `AppDelegate.swift` вашего проекта в методе `application(_:didFinishLaunchingWithOptions:)` осуществите инициализацию SDK:

Если в проекте используется YandexPay, то для настройки YandexLoginSDK используйте пункты 1-3 [инструкции](https://yandex.ru/dev/mobileauthsdk/doc/sdk/concepts/ios/2.0.0/sdk-ios-install.html).

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    do {
        // Инициализируйте SDK 
        // Если в проекте используется YandexPay, то необходимо указать соответсвующие параметры:
        // isYandexPayEnabled - активация YandexPaySDK
        // isSandboxMode - режим песочницы
        try Cloudtips.initialize(isYandexPayEnabled: true, isSandboxMode: true)
    } catch {
        fatalError("Unable to initialize CloudtipsSDK.")
    }
        
    // Инициализируйте UIWindow и ViewController
    let controller = ViewController()
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = controller
    window.makeKeyAndVisible()
    self.window = window
        
    return true
}
```

Также в `AppDelegate.swift` вашего проекта добавьте нотификацию `CloudtipsSDK` о событиях жизенного цикла приложения:

```swift
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
```

### Использование

1) Создайте объект CloudtipsUser, передайте в него Layout и имя пользователя. Если вы являетесь партнером CloudTips, передайте в конфигурацию id партнера
```
let user = CloudtipsUser(layoutId: text, name: "Cloudtips demo user", agentCode: "ctdemo")

let configuration = CloudtipsConfiguration(user: user,
    applePayMerchantId: "merchant.ru.cloudpayments",
    style: nil,
    delegate: self,
    testMode: false)

```

2) Для возможности оплаты с Apple Pay передайте в конфигурацию ваш Apple Pay merchant id.

```
applePayMerchantId
```

3) Вызовите CloudtipsViewController внутри вашего контроллера

```
Cloudtips.instance.show(with: configuration, from: self)
```

### Поддержка

По возникающим вопросам техничечкого характера обращайтесь на support@cloudpayments.ru
