//
//  UIViewController.swift
//  Custom Components
//
//  Created by Kha Nguyen on 6/9/24.
//

import UIKit

extension UIViewController {
    func setUpTapOutsideToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
