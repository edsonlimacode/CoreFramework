//
//  CheckBox.swift
//  CoreFramework
//
//  Created by edson lima on 22/01/26.
//

import Foundation
import UIKit

public class CheckBoxButton: UIButton {

    private var isChecked: Bool = false
    private var checkedImage: UIImage? = UIImage(named: "checked")
    private var uncheckedImage: UIImage? = UIImage(named: "unchecked")

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(didTapCheck), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func didTapCheck() {
        self.isChecked.toggle()

        self.setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }

    public func getChecked() -> Bool {
        return isChecked
    }
}
