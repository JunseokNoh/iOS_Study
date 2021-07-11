//
//  PersonViewModel.swift
//  MVVM_Practice
//
//  Created by junseok on 2021/07/11.
//

import Foundation
import UIKit

struct PersonViewModel {
    typealias Listener = (Person) -> Void
    var listener: Listener?

    var person: Person {
        didSet {
            listener?(person)
        }
    }

    mutating func bind(listener: Listener?) {
        self.listener = listener
    }
}
