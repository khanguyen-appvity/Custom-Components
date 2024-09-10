//
//  ViewController.swift
//  Custom Components
//
//  Created by Kha Nguyen on 9/8/24.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa

class ViewController: UIViewController {
    private let textFieldUsername: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Username"
        return textField
    }()
    
    private let textFieldEmail: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = "Email"
        return textField
    }()
    
    private let textFieldPassword: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textFieldUsername, textFieldEmail, textFieldPassword])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .top
        return stackView
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpObservers()
    }

    private func setUpViews() {
        view.backgroundColor = AppColorV4.background
        view.addSubview(vStackView)
        setUpTapOutsideToDismissKeyboard()

        vStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        textFieldUsername.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        textFieldEmail.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        textFieldPassword.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    private func setUpObservers() {
        textFieldEmail.textPublisher.sink { text in
            guard let text = text, !text.isEmpty else {
                self.textFieldEmail.errorMessage = ""
                self.textFieldEmail.warningMessage = ""
                return
            }
            
            self.textFieldEmail.errorMessage = !text.contains("@") ? "Invalid email address" : ""
            self.textFieldEmail.warningMessage = text.contains("#") ? "Invalid special character" : ""
        }.store(in: &cancellables)
    }
}

