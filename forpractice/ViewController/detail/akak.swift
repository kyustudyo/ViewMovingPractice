//
//  aa.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//
import Foundation
import UIKit


class akak : UICollectionViewController {
    
    var color : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = color!
    }
    @IBAction func GoNewWorld(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
    
}
