//
//  LoginViewController.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/4/26.
//

import UIKit

class LoginViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 169, width: 238, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    } ()
    
    let loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.font = .boldSystemFont(ofSize: 14)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 334, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.font = .boldSystemFont(ofSize: 14)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        
        return textField
    }()
    
    lazy var loginBUtton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 462, width: 335, height: 52))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginBUtton)
    }
    
    @objc
    func loginButtonDidTapped() {
        //presentToWelcomeVC()
        navigateToWelcomeVC()
    }
    
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
