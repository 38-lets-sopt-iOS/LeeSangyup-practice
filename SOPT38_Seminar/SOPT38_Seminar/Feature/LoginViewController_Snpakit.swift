//
//  LoginViewController_Snpakit.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/4/26.
//

import UIKit

import SnapKit

class LoginViewController_Snpakit: UIViewController {
    
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
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(169)
        }
        
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(63)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginBUtton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(128)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
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
