//
//  DetailViewController.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    var array : NmPnm?
    var vm :TransportViewModel?
    
    @IBOutlet weak var cmpyNm: UILabel!
    @IBOutlet weak var rprsvPnm: UILabel!
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 텍스트는 code로 만들었습니다."
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        rprsvPnm.text = array?.rprsvPnm
        cmpyNm.text = array?.cmpyNm
        view.addSubview(descriptionLabel)
        // stroyboard로 만든 view와 code로 만든 뷰 둘다 사용 가능
        descriptionLabel.centerX(inView: cmpyNm)
        descriptionLabel.anchor(top: cmpyNm.bottomAnchor, paddingTop: 10)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cyan"{
            prepareSegueForakak(segue: segue)
        }
    }
    
    func prepareSegueForakak(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else {
            fatalError()
        }
        guard let vc = nav.viewControllers.first as? CyanViewController else {
            fatalError()
        }
        vc.color = .cyan
    }
}

