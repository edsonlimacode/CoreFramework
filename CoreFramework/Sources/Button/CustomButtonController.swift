//
//  CustomButtomController.swift
//  CoreFramework
//
//  Created by edson lima on 22/01/26.
//

import Foundation
import UIKit

public class CustomButtonController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        guard let iconImage = UIImage(systemName: "star") else { return }
        
        let buttonWithIcon = CustomButton(title: "botao1", icon: iconImage, iconPosition: .horizontal)
        let buttonWithOutIcon = CustomButton(title: "botao2")

        buttonWithIcon.translatesAutoresizingMaskIntoConstraints = false
        buttonWithOutIcon.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(buttonWithIcon)
        self.view.addSubview(buttonWithOutIcon)

        NSLayoutConstraint.activate([
            buttonWithIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonWithIcon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            buttonWithIcon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Metrics.medium),
            buttonWithIcon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -Metrics.medium),
            buttonWithIcon.heightAnchor.constraint(equalToConstant: 50),

            buttonWithOutIcon.topAnchor.constraint(equalTo: buttonWithIcon.bottomAnchor, constant: Metrics.medium),
            buttonWithOutIcon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Metrics.medium),
            buttonWithOutIcon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -Metrics.medium),
            buttonWithOutIcon.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
