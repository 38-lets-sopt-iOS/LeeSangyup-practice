//
//  LoginViewController_AutoLayout.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/4/26.
//

import UIKit

class LoginViewController_AutoLayout: UIViewController {
    
    // MARK: - UIComponent
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    } ()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.backgroundColor = .Grey200
        textField.font = .subhead4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.backgroundColor = .Grey200
        textField.font = .subhead4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    lazy var loginBUtton: BaseFillButton = {
        let button = BaseFillButton()
        button.setTitle("로그인하기", for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    // MARK: - Layout
    func setUI() {
        view.addSubviews(titleLabel,
                         loginTextField,
                         passwordTextField,
                         loginBUtton)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginBUtton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 169)])
        
        NSLayoutConstraint.activate([loginTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 63),
                                     loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     loginTextField.heightAnchor.constraint(equalToConstant: 52)])
        
        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 7),
                                     passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
        
        NSLayoutConstraint.activate([loginBUtton.topAnchor  .constraint(equalTo: passwordTextField.bottomAnchor, constant: 128),
                                     loginBUtton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
                                     loginBUtton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     loginBUtton.heightAnchor.constraint(equalToConstant: 57)])
    }
    
    // MARK: - Action Method
    @objc
    func loginButtonDidTapped() {
        //presentToWelcomeVC()
        navigateToWelcomeVC()
    }
    
    // MARK: - Navigation Method
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.configure(id: loginTextField.text)
        self.present(welcomeViewController,animated: true)
    }
    
    func navigateToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        //welcomeViewController.id = loginTextField.text
        welcomeViewController.configure(id: loginTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
