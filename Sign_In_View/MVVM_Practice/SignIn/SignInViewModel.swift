//
//  ViewModel.swift
//  MVVM_Practice
//
//  Created by junseok on 2021/07/05.
//

import Foundation
import UIKit

class SignInViewModel {
    typealias Listener = (Account) -> Void
    var listener: Listener?
    var account: Account
    
    init(listener : Listener?, account : Account){
        self.listener = listener
        self.account = account
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
    }

    @objc func sendAccount(_ button: UIButton) {
        print(account)
    }
}
