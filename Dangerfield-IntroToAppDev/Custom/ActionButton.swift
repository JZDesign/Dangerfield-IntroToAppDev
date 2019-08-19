//
//  ActionButton.swift
//  Dangerfield-IntroToAppDev
//
//  Created by eli dangerfield on 8/18/19.
//  Copyright © 2019 Jacob Rakidzich. All rights reserved.
//
import UIKit
typealias ACTION = (() -> ())?

//final such that swift compiler doesnt use dynamic dispatch, performance increase
final class ActionButton: UIButton {

    var action: ACTION = nil
    var callback: ((Bool) -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    func setupButton() {
        addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        setShadow()
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor.blue
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
    }

    @objc
    func handleAction() {
        action?()
    }

//    @objc
//    func handleActionTwo() {
//        callback?(true)
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //have to set this here as the height is not known until this callback
        layer.cornerRadius = bounds.height / 2.0
    }

    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
