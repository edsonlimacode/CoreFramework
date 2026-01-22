//
//  CheckBoxController.swift
//  CoreFramework
//
//  Created by edson lima on 22/01/26.
//

import Foundation
import UIKit

public class CheckBoxController: UIViewController {

    let checkBoxView = CheckBoxButton()

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {

        self.view.addSubview(checkBoxView)
    
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkBoxView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            checkBoxView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            checkBoxView.heightAnchor.constraint(equalToConstant: 50),
            checkBoxView.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}
