//
//  ScrollViewPractice2.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/11/26.
//

import UIKit
import SnapKit

class ScrollViewPractice2: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        purpleView.backgroundColor = .purple
        blueView.backgroundColor = .blue
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(redView, orangeView, yellowView, greenView, purpleView, blueView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(337)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(337)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(337)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(337)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
    }
}
