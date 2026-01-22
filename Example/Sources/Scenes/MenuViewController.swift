//
//  ViewController.swift
//  Example
//
//  Created by edson lima on 21/01/26.
//

import CoreFramework
import UIKit

class MenuViewController: UIViewController {

    let menuView = MenuView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupActions()
    }

    private func setupUI() {
        self.view.addSubview(menuView)

        setupConstraints()
    }

    private func setupActions() {
        menuView.didTapOnboard = { [weak self] in
            self?.showOnboarding()
        }
    }

    private func showOnboarding() {
        let onboardingView = OnboardingView()

        let steps = [
            (UIImage(named: "image1"), "instrucao 01"),
            (UIImage(named: "image2"), "instrucao 02"),
            (UIImage(named: "image3"), "instrucao 03"),
        ]

        onboardingView.presentOnboardingToView(on: view, steps: steps)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
