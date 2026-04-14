//
//  AutoLayout_Practice.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/11/26.
//

import UIKit

class AutoLayout_Practice: UIViewController {
    var rectangle_yellow: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = .yellow
        return rectangle
    }()
    
    var rectangle_green: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = .green
        return rectangle
    }()
    
    var rectangle_black: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = .black
        return rectangle
    }()
    
    var rectangle_blue: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = .blue
        return rectangle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    func setUI() {
        view.addSubviews(rectangle_yellow,
                         rectangle_green,
                         rectangle_black,
                         rectangle_blue
                         )
        rectangle_yellow.translatesAutoresizingMaskIntoConstraints = false
        rectangle_green.translatesAutoresizingMaskIntoConstraints = false
        rectangle_black.translatesAutoresizingMaskIntoConstraints = false
        rectangle_blue.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([rectangle_yellow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     rectangle_yellow.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     rectangle_yellow.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([rectangle_green.leadingAnchor.constraint(equalTo: rectangle_yellow.trailingAnchor),
                                     rectangle_green.topAnchor.constraint(equalTo: rectangle_yellow.bottomAnchor),
                                     rectangle_green.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     rectangle_green.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([rectangle_black.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     rectangle_black.topAnchor.constraint(equalTo: rectangle_green.bottomAnchor),
                                     rectangle_black.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     rectangle_black.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([rectangle_blue.leadingAnchor.constraint(equalTo: rectangle_black.trailingAnchor),
                                     rectangle_blue.topAnchor.constraint(equalTo: rectangle_black.bottomAnchor),
                                     rectangle_blue.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     rectangle_blue.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
    }
}
