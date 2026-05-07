//
//  LoginViewController_Closure.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/4/26.
//

import UIKit

class LoginViewController_Closure: UIViewController {
    
    // MARK: - UIComponent
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 169, width: 238, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    } ()
    
    let loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 277, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.backgroundColor = .Grey200
        textField.font = .subhead4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = .Grey200
        textField.font = .subhead4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    lazy var loginBUtton: BaseFillButton = {
        let button = BaseFillButton(frame: CGRect(x: 20, y: 515, width: 335, height: 57))
        button.setTitle("로그인하기", for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    // MARK: - Layout
    func setUI() {
        view.addSubviews(titleLabel,
                         loginTextField,
                         passwordTextField,
                         loginBUtton)
    }
    
    // MARK: - Action Method
    @objc
    func loginButtonDidTapped() {
        //presentToWelcomeVC()
        navigateToWelcomeVC()
    }
    
    // MARK: - Navigation Method
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.configure(id: loginTextField.text)
        self.present(welcomeViewController,animated: true)
    }
    
    func navigateToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        //welcomeViewController.id = loginTextField.text
        welcomeViewController.configure(id: loginTextField.text)
        welcomeViewController.backToLoginCompletion = { [weak self] data in
            guard let self else { return }
            print("클로저로 받아온 값은 \(data)임!!")
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
            self.titleLabel.text = "\(data)님 다시 로그인해야해요!"
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
