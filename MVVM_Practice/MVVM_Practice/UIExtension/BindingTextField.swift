//
//  BindingTextField.swift
//  MVVM_Practice
//
//  Created by junseok on 2021/07/11.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    var textChanged: (String) -> Void = { _ in }

    func bind(callBack: @escaping (String) -> Void) {
        textChanged = callBack
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc func textFieldDidChange() {
        //UITextField에 이미 있는 프로퍼티
        guard let text = text else { return }
        textChanged(text)
    }
}
