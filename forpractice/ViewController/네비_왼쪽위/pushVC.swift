//
//  pushVC.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation
import UIKit

class PushVC : UIViewController {//푸쉬해서 와서 이미 뒤로가기 버튼있다.
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("dismiss !", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backButton)
        backButton.centerX(inView: view)
        backButton.centerY(inView: view)
    }
    
    // navi에서 push한게 돌아가는것이 아니라, 
    @objc private func back() {
        dismiss(animated: true)
    }
}
