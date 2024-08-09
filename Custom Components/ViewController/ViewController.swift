//
//  ViewController.swift
//  Custom Components
//
//  Created by Kha Nguyen on 9/8/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let textField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Username"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }

    private func setUpViews() {
        view.backgroundColor = AppColorV4.background
        view.addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(44)
        }
        
        applySkyscannerTheme(textField: textField)
    }
    
    func applySkyscannerTheme(textField: SkyFloatingLabelTextField) {
        textField.tintColor = AppColorV4.accent
        textField.textColor = AppColorV4.Text.default
        textField.lineColor = AppColorV4.borderDivider
        textField.selectedTitleColor = AppColorV4.accent
        textField.selectedLineColor = AppColorV4.accent

        textField.titleLabel.font = .systemFont(ofSize: 12)
        textField.placeholderFont = .systemFont(ofSize: 16)
        textField.font = .systemFont(ofSize: 16)
    }
}

