//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by edson lima on 21/01/26.
//

import Foundation
import UIKit

public class OnboardingView: UIView {

    private var steps: [String] = []
    private var currentStep = 0

    let backgroundView = {
        let view = UIView()
        view.backgroundColor = Colors.gray100.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let messageLabel = {
        let message = UILabel()
        message.tintColor = Colors.gray300
        message.font = Typography.heading
        message.numberOfLines = 0
        message.textAlignment = .left
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()

    let nextButton = {
        let button = UIButton()
        button.setTitle("proximo", for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.setTitleColor(Colors.primaryRedBase, for: .normal)
        button.addTarget(self, action: #selector(didTapNextStep), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(backgroundView)
        addSubview(messageLabel)
        addSubview(nextButton)

        setupConstraints()
    }

    @objc
    private func didTapNextStep() {
        currentStep += 1
        if currentStep < steps.count {
            messageLabel.text = steps[currentStep]
        } else {
            removeFromSuperview()
        }
    }

    //Adiciona essa tela, no caso onborading a view que chamar ela
    public func presentOnboardingToView(on view: UIView, steps: [String]) {
        self.steps = steps
        self.currentStep = 0

        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),

            nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.small),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
