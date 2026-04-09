//
//  WelcomeViewController.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/4/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    private var id: String?
    
    // MARK: - UIComponent
    let uiImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        image.image = UIImage(named: "profile")
        return image
    } ()
    
    let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 100, height: 60))
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    } ()
    
    lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 52))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    let reloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 52))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        //bindID()
    }
    
    // MARK: - Layout
    func setUI() {
        view.backgroundColor = .white
        view.addSubviews(uiImage,
                         welcomeLabel,
                         mainButton,
                         reloginButton)
    }
    
    // MARK: - Private Method
//    private func bindID() {
//        welcomeLabel.text = "\(id)님 반가워요!"
//    }
    
    // MARK: - Data Method
    func configure(id: String?) {
        self.id = id
        welcomeLabel.text = "\(id ?? "알수없음")님 반가워요!"
    }
    
    // MARK: - Action Method
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
