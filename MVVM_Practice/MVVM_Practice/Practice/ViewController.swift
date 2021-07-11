//
//  ViewController.swift
//  MVVM_Practice
//
//  Created by junseok on 2021/07/11.
//
import UIKit

class ViewController: UIViewController {
    //typealias Listener = (Person) -> Void
    //let person = Person(name: "노준석", age: 25)
    var personViewModel : PersonViewModel = PersonViewModel(listener: nil, person:Person(name: "", age: 0))

    @IBOutlet weak var nameTextField: BindingTextField! {
        didSet {
            nameTextField.bind { [weak self] name in
            self?.personViewModel.person.name = name
            }
        }
    }
    
    @IBOutlet weak var ageTextField: BindingTextField! {
        didSet {
            ageTextField.bind { [weak self] ageText in
            guard let age = Int(ageText) else { return }
            self?.personViewModel.person.age = age
            }
        }
    }

    @IBOutlet weak var yearLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        personViewModel.bind { [weak self] person in
            self?.yearLabel.text = person.name + " " + "\(person.age)세"
        }
    }
}
