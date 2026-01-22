//
//  CustomButton.swift
//  CoreFramework
//
//  Created by edson lima on 22/01/26.
//

import Foundation
import UIKit

protocol CustomButtonDelegate: AnyObject {
    func buttonActions()
}

public class CustomButton: UIButton {

    weak var delegate: CustomButtonDelegate?
    private var iconPosition: NSLayoutConstraint.Axis?

    init(title: String, backgroundColor: UIColor = Colors.primaryRedBase) {
        super.init(frame: .zero)
        setupButton(title: title, icon: nil, iconPosition: nil, backgroundColor: backgroundColor)
    }

    init(
        title: String,
        icon: UIImage? = nil,
        iconPosition: NSLayoutConstraint.Axis? = nil,
        backgroundColor: UIColor? = Colors.primaryRedBase
    ) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: icon,
            iconPosition: iconPosition,
            backgroundColor: backgroundColor ?? Colors.primaryRedBase
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton(title: String, icon: UIImage?, iconPosition: NSLayoutConstraint.Axis?, backgroundColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 12
        self.tintColor = .white
        self.setTitleColor(Colors.gray800, for: .normal)
        self.addTarget(self, action: #selector(didTapClick), for: .touchUpInside)

        if let icon = icon, let iconPosition = iconPosition {
            self.setImage(icon, for: .normal)
            self.iconPosition = iconPosition
            adjustIconPosition()
        }
    }

    @objc
    private func didTapClick() {
        delegate?.buttonActions()
    }

    private func adjustIconPosition() {
        guard let iconPosition  = iconPosition else { return }
        
        if iconPosition == .horizontal {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        }else {
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -8, right: 0)
        }
    }
}
