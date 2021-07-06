//
//  ViewModel.swift
//  MVVM_Practice
//
//  Created by junseok on 2021/07/05.
//

import Foundation
import UIKit

struct SignInViewModel {
    typealias Listener = (Account) -> Void
    var listener: Listener?
    
    var account: Account {
        didSet {
            listener?(account)
        }
    }

    mutating func bind(listener: Listener?) {
        self.listener = listener
    }
}
