//
//  MainView.swift
//  Basic App
//
//  Created by eli dangerfield on 6/5/19.
//  Copyright © 2019 eli dangerfield. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    // MARK: - PROPERTIES
    var titleLabel: UILabel = {

        let label = UILabel()
        label.text = "Welcome User!"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //set a max font so it adjusts to width
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 100)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()

    var signupButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Sign Up", for: .normal)
        return button
    }()

    var signinButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signupButton, signinButton])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()

    // MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
    // MARK: REQUIRED INIT
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    // MARK: - HELPERS
    fileprivate func setupView() {

        backgroundColor = Colors.primaryColor

        self.addSubview(titleLabel)
        self.addSubview(buttonStackView)

        setConstraints()

    }

    fileprivate func setConstraints() {

        titleLabel
            .width(UIElementSizes.windowWidth - 80)
            .top(safeAreaLayoutGuide.topAnchor)
            .centerX(centerXAnchor)
            .build()

        buttonStackView
            .height(2 * UIElementSizes.actionButtonHeight + 20)
            .top(centerYAnchor, constant: UIElementSizes.windowHeight/4)
            .leading(leadingAnchor, constant: 20)
            .trailing(trailingAnchor, constant: -20).build()
    }
}
