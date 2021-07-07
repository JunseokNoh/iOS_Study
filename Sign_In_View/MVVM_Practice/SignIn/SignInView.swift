//
//  ViewController.swift
//  MVVM_Practice
//
//  Created by junseok on 2021/07/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var signInViewModel : SignInViewModel = SignInViewModel(listener: nil, account: Account(email: "", password: "", password2: "", name: "", student_id: ""))
    
    var emailTextField: BindingTextField! {
        didSet {
            emailTextField.bind { [weak self] email in
                self?.signInViewModel.account.email = email
                if email.count < 1 {
                    self?.emailTextField.textFieldBorderSetup(result: .Fail)
                }else{
                    self?.emailTextField.textFieldBorderSetup(result: .Success)
                }
            }
            emailTextField.delegate = self
        }
    }
    
    var pwTextField: BindingTextField! {
        didSet {
            pwTextField.textContentType = .password
            pwTextField.bind { [weak self] pw in
                print("pw : \(pw) \(self?.signInViewModel.account)")
                self?.signInViewModel.account.password = pw
                
                if pw.count < 1 || pw != self?.signInViewModel.account.password2 {
                    self?.pwTextField.textFieldBorderSetup(result: .Fail)
                }else{
                    self?.pwTextField.textFieldBorderSetup(result: .Success)
                    self?.pw2TextField.textFieldBorderSetup(result: .Success)
                }
            }
            pwTextField.delegate = self
        }
    }
    
    var pw2TextField: BindingTextField! {
        didSet {
            pw2TextField.textContentType = .password
            pw2TextField.bind { [weak self] pw2 in
                self?.signInViewModel.account.password2 = pw2
                print("pw2 : \(pw2) \(self?.signInViewModel.account)")
                    
                if pw2.count < 1 || pw2 != self?.signInViewModel.account.password {
                    self?.pw2TextField.textFieldBorderSetup(result: .Fail)
                }else{
                    self?.pwTextField.textFieldBorderSetup(result: .Success)
                    self?.pw2TextField.textFieldBorderSetup(result: .Success)
                }
            }
            pw2TextField.delegate = self
        }
    }
    
    var nameTextField: BindingTextField! {
        didSet {
            nameTextField.bind { [weak self] name in
                self?.signInViewModel.account.name = name
                if name.count < 1 {
                    self?.nameTextField.textFieldBorderSetup(result: .Fail)
                }else{
                    self?.nameTextField.textFieldBorderSetup(result: .Success)
                }
            }
            nameTextField.delegate = self
        }
    }
    
    var stuidTextField: BindingTextField! {
        didSet {
            stuidTextField.bind { [weak self] student_id in
                self?.signInViewModel.account.student_id = student_id
                if student_id.count < 1 {
                    self?.stuidTextField.textFieldBorderSetup(result: .Fail)
                }else{
                    self?.stuidTextField.textFieldBorderSetup(result: .Success)
                }
            }
            stuidTextField.delegate = self
        }
    }
    
    let emailTitle : UILabel = UILabel()
    let pwTitle : UILabel = UILabel()
    let pw2Title : UILabel = UILabel()
    let nameTitle : UILabel = UILabel()
    let stuidTitle : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTitle()
        initTextField()
        addView()
        initConstraints()
        
        signInViewModel.bind { [weak self] account in
           
        }
        
    }
    
    func addView(){
        self.view.addSubview(emailTextField)
        self.view.addSubview(pwTextField)
        self.view.addSubview(pw2TextField)
        self.view.addSubview(nameTextField)
        self.view.addSubview(stuidTextField)
        
        self.view.addSubview(emailTitle)
        self.view.addSubview(pwTitle)
        self.view.addSubview(pw2Title)
        self.view.addSubview(nameTitle)
        self.view.addSubview(stuidTitle)
    }
    
    func initTextField(){
        emailTextField = BindingTextField()
        pwTextField = BindingTextField()
        pw2TextField = BindingTextField()
        nameTextField = BindingTextField()
        stuidTextField = BindingTextField()
    }
    func initTitle(){
        emailTitle.text = "Email"
        pwTitle.text = "비밀번호"
        pw2Title.text = "비밀번호 확인"
        nameTitle.text = "이름"
        stuidTitle.text = "학번"
    }
    
    func initConstraints(){
        let title_height = 30
        let height = 40
        let top_padding = 30
        let title_To_textField_margin = 5
        let left_margin = 30
        let right_margin = -30
        
        // MARK: - Email
        emailTitle.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(150)
            make.height.equalTo(title_height)
        }
        
        emailTextField.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(emailTitle.snp.bottom).offset(title_To_textField_margin)
            make.height.equalTo(height)
        }
        
        // MARK: - 비밀번호
        pwTitle.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(emailTextField.snp.bottom).offset(top_padding)
            make.height.equalTo(title_height)
        }
        
        pwTextField.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(pwTitle.snp.bottom).offset(title_To_textField_margin)
            make.height.equalTo(height)
        }
        
        // MARK: - 비밀번호 확인
        pw2Title.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(pwTextField.snp.bottom).offset(top_padding)
            make.height.equalTo(title_height)
        }
        
        pw2TextField.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(pw2Title.snp.bottom).offset(title_To_textField_margin)
            make.height.equalTo(height)
        }
        
        // MARK: - 이름
        nameTitle.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(pw2TextField.snp.bottom).offset(top_padding)
            make.height.equalTo(title_height)
        }
        
        nameTextField.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(nameTitle.snp.bottom).offset(title_To_textField_margin)
            make.height.equalTo(height)
        }
        
        // MARK: - 학번
        stuidTitle.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(nameTextField.snp.bottom).offset(top_padding)
            make.height.equalTo(title_height)
        }
        
        stuidTextField.snp.makeConstraints{ make in
            make.left.equalTo(left_margin)
            make.right.equalTo(right_margin)
            make.top.equalTo(stuidTitle.snp.bottom).offset(title_To_textField_margin)
            make.height.equalTo(height)
        }
        
    }
}

extension ViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(textField.text!)
//        if textField.text!.count < 10 {
//            //textField.redBorderSet()
//            textField.layer.borderColor = UIColor.systemRed.cgColor
//        } else {
//            textField.layer.borderColor = UIColor.systemBlue.cgColor
//        }
//
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
