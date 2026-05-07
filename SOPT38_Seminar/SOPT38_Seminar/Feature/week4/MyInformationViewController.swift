//
//  MyInformationViewController.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/7/26.
//

import UIKit

import SnapKit
import Then

final class MyInformationViewController: UIViewController {
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var editButton = UIButton()
    
    private var id: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    private var part: String = ""
    
    private var userId: Int
    
    init(userId: Int) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setStyle()
        setAddTarget()
        getUserInformation()
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel, idTextField, nameTextField, emailTextField, ageTextField, partTextField, editButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        let placeholder = ["아이디", "비밀번호", "이름", "이메일", "나이", "iOS, 안드로이드, 웹 중 하나를 입력해주세요."]
        
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField]
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
        
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .head1
        }
        
        editButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
    }
    
    private func getUserInformation() {
        Task {
            do {
                let response = try await GetUserInfoService.shared.getUserInfo(userId: userId)
                UpdateUI(userInfo: response.data)
                print("현재유저아이디:\(userId)")
            } catch {
                let alert = UIAlertController(
                    title: "유저 조회 실패",
                    message : error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("유저 조회 실패", error)
                print("현재유저아이디:\(userId)")
            }
        }
    }
    
    private func UpdateUI(userInfo: UserInformation) {
        idTextField.text = userInfo.loginId
        nameTextField.text = userInfo.name
        emailTextField.text = userInfo.email
        ageTextField.text = String(userInfo.age)
        partTextField.text = userInfo.part
        
        idTextField.isEnabled = false
        partTextField.isEnabled = false
    }
}

extension MyInformationViewController {
    @objc private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case nameTextField:
            name = textField.text ?? ""
        case emailTextField:
            email = textField.text ?? ""
        case ageTextField:
            age = Int(textField.text ?? "") ?? 0
        case partTextField:
            part = (textField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        default:
            return
        }
    }
    
    @objc private func editButtonDidTap() {
       Task {
            do {
//                let _ = try await SignupService.shared.postSignup(
//                    loginId: id, password: password, name: name, email: email, age: age, part: part
//                )
//                
//                self.navigationController?.pushViewController(LoginAPIViewController(), animated: true)
                print("회원가입 성공")
            } catch {
                let alert = UIAlertController(
                    title: "회원가입 실패",
                    message : error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("회원가입 실패", error)
            }
        }
    }
}
