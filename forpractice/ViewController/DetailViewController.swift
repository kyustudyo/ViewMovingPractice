//
//  DetailViewController.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    var array : Two?
    var vm :MyModelViewModel?
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        updateUI()
        print("sd",vm?.array[0].cmpyNm)
        
    }
    
    func updateUI(){
        
        print("@@@",array?.rprsvPnm)
        label1.text = array?.rprsvPnm
        label2.text = array?.cmpyNm
        label3.text = array?.rprsvPnm
//        if let col = akakak {
//            print("d")
//        } else {print("??")}
        
    }
    
    @IBAction func GoNewWorld(_ sender: UIButton) {
        print(array?.rprsvPnm,array?.cmpyNm)
        
        //navigationController?.pushViewController(, animated: true)
    }
    
}
