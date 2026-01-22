//
//  MenuView.swift
//  CoreFramework
//
//  Created by edson lima on 21/01/26.
//

import CoreFramework
import Foundation
import UIKit

class MenuView: UIView {

    public var didTapOnboard: (() -> Void)?

    let titleLabel = {
        let title = UILabel()
        title.text = "Menu"
        title.textColor = .red
        title.font = Typography.heading
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    let checkbox = CheckBoxButton()

    lazy var onBoardingButton = {
        let button = UIButton()
        button.setTitle("Onboarding", for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapOnboardingButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var showCheckboxButton = {
        let button = UIButton()
        button.setTitle("Ver checkbox", for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapShowCheckbok), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var showCustomButtons = {
        let button = UIButton()
        button.setTitle("Ver botoes", for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapShowButtons), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(onBoardingButton)
        addSubview(showCheckboxButton)
        addSubview(showCustomButtons)
        setupConstraints()
    }

    @objc
    private func didTapOnboardingButton() {
        didTapOnboard?()
    }

    @objc
    private func didTapShowCheckbok() {
        let checkBoxController = CheckBoxController()

        if let parentViewController = self.window?.rootViewController {
            parentViewController.present(checkBoxController, animated: true)
        }
    }
  
    @objc
    private func didTapShowButtons() {
        let customButtonController = CustomButtonController()

        if let parentViewController = self.window?.rootViewController {
            parentViewController.present(customButtonController, animated: true)
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -Metrics.medium),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            onBoardingButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            onBoardingButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            onBoardingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            onBoardingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            onBoardingButton.heightAnchor.constraint(equalToConstant: 50),

            showCheckboxButton.topAnchor.constraint(equalTo: onBoardingButton.bottomAnchor, constant: Metrics.medium),
            showCheckboxButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            showCheckboxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            showCheckboxButton.heightAnchor.constraint(equalToConstant: 50),
            
            showCustomButtons.topAnchor.constraint(equalTo: showCheckboxButton.bottomAnchor, constant: Metrics.medium),
            showCustomButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            showCustomButtons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            showCustomButtons.heightAnchor.constraint(equalToConstant: 50),

        ])
    }

}
