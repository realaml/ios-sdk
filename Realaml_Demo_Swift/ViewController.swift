//
//  ViewController.swift
//  Realaml_DEMO_Swift
//
//  Copyright © 2023 Realaml. All rights reserved.
//

import UIKit
import Realaml

class ViewController: UIViewController {

    let signKey = "YOUR_SIGNATURE_KEY"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func startAct(_ sender: Any) {

        let kycViewController: KYCViewController = KYCViewController(environment: .staging, signatureKey: signKey)
        kycViewController.delegate = self
        self.present(kycViewController, animated: true)

    }
}

extension ViewController: KYCViewControllerDelegate {
    func kycViewController(_ controller: KYCViewController, didFinishWith error: Error?) {
        controller.dismiss(animated: true)
    }

    func kycViewControllerDidCancelled(_ controller: KYCViewController) {
        controller.dismiss(animated: true)
    }
}

