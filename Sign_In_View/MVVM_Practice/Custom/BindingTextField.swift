//
//  BindingTextField.swift
//  MVVM_Practice
//
//  Created by junseok on 2021/07/05.
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
    
    override func draw(_ rect: CGRect) {
      setup()
    }
    
    func setup() {
        let border = CAShapeLayer()
        
        let borderWidth:CGFloat = 0.5
        let cornerRadius:CGFloat = 3

        border.lineWidth = borderWidth
        border.frame = self.bounds
        border.fillColor = nil
        border.strokeColor = UIColor.gray.cgColor
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        
        self.layer.addSublayer(border)
        self.layer.cornerRadius = cornerRadius
   }
    
}

enum TextFieldImageSide {
    case left
    case right
}

extension BindingTextField {
    func setUpImage(imageName: String, on side: TextFieldImageSide) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 30, height: 30))
        if let imageWithSystemName = UIImage(systemName: imageName) {
            imageView.image = imageWithSystemName
        } else {
            imageView.image = UIImage(named: imageName)
        }
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 40))
        imageContainerView.addSubview(imageView)
        
        switch side {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
        case .right:
            imageView.tintColor = .red
            rightView = imageContainerView
            rightViewMode = .always
        }
    }
}
