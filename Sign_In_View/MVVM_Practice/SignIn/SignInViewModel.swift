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
    var account: Account = Account(email: "", password: "", password2: "", name: "", student_id: "")
    
    init(listener : Listener?){
        self.listener = listener
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
    }

    @objc func sendAccount(_ button: UIButton) {
        let signInRequest = SignInRequest(requestBodyObject: self.account, requestMethod: .Post, enviroment: .SignIn)
        let result = signInRequest.request()
        print(result)
    }
}
