//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by edson lima on 21/01/26.
//

import Foundation
import UIKit

public class OnboardingView: UIView {

    private var steps: [(image: UIImage?, text: String)] = []
    private var currentStep = 0

    let backgroundView = {
        let view = UIView()
        view.backgroundColor = Colors.gray100.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let messageLabel = {
        let message = UILabel()
        message.tintColor = Colors.gray700
        message.font = Typography.heading
        message.numberOfLines = 0
        message.textAlignment = .center
        message.alpha = 0
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()

    let imageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        addSubview(imageView)
        addSubview(messageLabel)
        addSubview(nextButton)

        setupConstraints()
    }

    @objc
    private func didTapNextStep() {
        currentStep += 1
        if currentStep < steps.count {
            setupSteps(animated: true)
        } else {
            removeFromSuperview()
        }
    }

    private func setupSteps(animated: Bool = false) {
        let step = self.steps[currentStep]

        imageView.image = step.image
        messageLabel.text = step.text

        if animated {
            animatedTextEntry()
        } else {
            messageLabel.alpha = 1
            messageLabel.transform = .identity
        }
    }

    //anima o text saindo da esquerda
    private func animatedTextEntry() {
        messageLabel.alpha = 0
        messageLabel.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)

        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.messageLabel.alpha = 1
                self.messageLabel.transform = .identity
            }
        )
    }

    //Adiciona essa tela, no caso onborading a view que chamar ela
    public func presentOnboardingToView(on view: UIView, steps: [(image: UIImage?, text: String)]) {
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

        setupSteps(animated: true)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -Metrics.medium),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),

            messageLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: Metrics.medium),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),

            nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.small),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
