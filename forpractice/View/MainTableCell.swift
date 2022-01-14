//
//  MainTableCell.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation
import UIKit

class MainTableCell : UITableViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    func confiugure(data:Two){
        label1.text = data.cmpyNm
        label2.text = data.rprsvPnm
    }
}
