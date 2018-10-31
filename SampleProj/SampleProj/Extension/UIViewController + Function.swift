//
//  UIViewController + Function.swift
//  SampleProj
//
//  Created by Yogesh on 10/30/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showOkAlert(message : String , title : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
