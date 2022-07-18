//
//  MainTableCell.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation
import UIKit

class MainTableCell : UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    func confiugure(data:NmPnm){
        name.text = data.cmpyNm
        detail.text = data.rprsvPnm
    }
}
