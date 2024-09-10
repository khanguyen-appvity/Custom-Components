//
//  SkyFloatingLabelTextField.swift
//  Custom Components
//
//  Created by Kha Nguyen on 6/9/24.
//

import Foundation

extension SkyFloatingLabelTextField {
    func applySkyscannerTheme() {
        self.tintColor = AppColorV4.accent
        self.textColor = AppColorV4.Text.default
        self.lineColor = AppColorV4.borderDivider
        self.selectedTitleColor = AppColorV4.accent
        self.selectedLineColor = AppColorV4.accent
        self.lineHeight = 1.0
        self.selectedLineHeight = 2.0
        self.errorMessagePlacement = .bottom
        
        self.titleLabel.font = AppFont.robotoRegular(ofSize: 12)
        self.placeholderFont = AppFont.robotoRegular(ofSize: 16)
        self.font = AppFont.robotoRegular(ofSize: 16)
    }
}
