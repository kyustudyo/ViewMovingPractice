//
//  instantiateViewController.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation
import UIKit

class naviInstantiVC : UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("open")
    }
    
    //instanti , 스토리상에 연결하지않음. 푸쉬
    @IBAction func push(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "push") as? PushVC else {return}
        print("dd")
        navigationController?.pushViewController(vc, animated: true)
        //푸쉬했기때문에 뒤로가기 버튼이 있다.
    }
    
    
}
