//
//  SimpleTextField.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//

import Foundation
import UIKit
final class SimpleTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = UIColor.gray.cgColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        leftViewMode = .always
        leftView = paddingView
        textAlignment = .left
    }
}
