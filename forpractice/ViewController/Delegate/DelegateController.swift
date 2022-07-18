//
//  DelegateController.swift
//  forpractice
//
//  Created by Hankyu Lee on 2022/07/18.
//

import UIKit

protocol EditDelegate: AnyObject {
    func edit(text: String)
    func exit()
}
class DelegateController: UIViewController {

    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Edit..!"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apply", for: .normal)
        button.addTarget(self, action: #selector(applyText), for: .touchUpInside)
        button.titleLabel?.textColor = .green
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Bye", for: .normal)
        button.addTarget(self, action: #selector(backToBefore), for: .touchUpInside)
        button.titleLabel?.textColor = .red
        return button
    }()
    
    @objc func backToBefore() {
        delegate?.exit()
    }
    
    @objc func applyText() {
        guard let text = textField.text else {
            delegate?.exit()
            return
        }
        delegate?.edit(text: text)
    }
    
    weak var delegate: EditDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()

        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        [textField, closeButton, applyButton].forEach { view in
            self.view.addSubview(view)
        }
        textField.centerX(inView: view)
        textField.centerY(inView: view)
        closeButton.centerX(inView: view)
        closeButton.anchor(top: textField.bottomAnchor, paddingTop: 15)
        applyButton.centerX(inView: view)
        applyButton.anchor(top: closeButton.bottomAnchor, paddingTop: 15)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
