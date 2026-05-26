//
//  LoginAPIViewController.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/6/26.
//

import UIKit

import SnapKit
import Then

final class LoginAPIViewController: UIViewController {
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    
    private var id = ""
    private var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(
            idTextField,
            passwordTextField,
            loginButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        let placeholder = ["아이디", "비밀번호"]
        
        [idTextField, passwordTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.setLeftPadding(20)
                    $0.placeholder = placeholder[index]
                    $0.borderStyle = .roundedRect
                    $0.autocapitalizationType = .none
                    $0.autocorrectionType = .no
                    $0.spellCheckingType = .no
                }
            }
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(70)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        [idTextField,passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

extension LoginAPIViewController {
    @objc private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            return
        }
    }
    
    @objc private func loginButtonDidTap() {
       Task {
            do {
                let response = try await LoginService.shared.postSignin(
                    loginId: id, password: password
                )
                let userId = response.data?.userId ?? 0
                print(userId)
                
                let myInformationViewController = MyInformationViewController(userId: userId)

                
                self.navigationController?.pushViewController(myInformationViewController, animated: true)
                print("로그인 성공")
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message : error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("로그인 실패", error)
            }
        }
    }
}
