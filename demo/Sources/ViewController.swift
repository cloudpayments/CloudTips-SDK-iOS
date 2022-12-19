//
//  ViewController.swift
//  Cloudtips-SDK-iOS-Demo
//
//  Created by Sergey Iskhakov on 29.09.2020.
//

import UIKit
import CloudtipsSDK
//import sdk

extension Bundle {
    class var tipsSdk: Bundle {
        let bundle = Bundle.init(for: ViewController.self)
        let bundleUrl = bundle.url(forResource: "CloudtipsSDKResources", withExtension: "bundle")
        let resBundle = Bundle.init(url: bundleUrl!)
        return resBundle!
    }
}



class ViewController: UIViewController {
    @IBOutlet private weak var textField: TextField!
    @IBOutlet private weak var continueButton: Button!

    //lazy var cloud = Cloud()


    override func viewDidLoad() {
        super.viewDidLoad()


//        self.textField.didChange = {
//            if let text = self.textField.text {
//                self.textField.text = text.formattedPhoneNumber()
//            }
//
//            self.validate()
//        }
//        self.validate()
//
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //cloud.show(from: self)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    private func validate(){
//        if let text = self.textField.text?.phoneNumber(), text.count == 11 {
//            self.continueButton.isEnabled = true
//        } else {
//            self.continueButton.isEnabled = false
//        }
    }

    @IBAction func onContinue(_ sender: UIButton) {
        if let text = self.textField.text {

            let user =  CloudtipsUser(layoutId: text, name: "Cloudtips demo user", agentCode: "ctdemo")

            let configuration = CloudtipsConfiguration(user: user,
                                                       applePayMerchantId: "merchant.ru.cloudpayments",
                                                       style: nil,
                                                       delegate: self,
                                                       testMode: false)

            Cloudtips.instance.show(with: configuration, from: self)

        }
    }

}

extension ViewController: TipsDelegate {
    func onTipsSuccessed() {
        print("Чаевые получены")
    }

    func onTipsCancelled() {
        print("Пользователь закрыл форму")
    }
}

