//
//  MyModelViewModel.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation

struct TransportViewModel {
    
    private let manager = TransportManager.shared
    
    var datas : [DataResponse] {
        return manager.datas
    }
    var array : [NmPnm] {
        return manager.array
    }
    var header : PageResultCode {
        return manager.header
    }
    
    func divideData(data: DataResponse){
        manager.divideData(data: data)
    }
    
}

class TransportManager {
    static let shared = TransportManager()
    static var lastId :Int = 0
    private init() {}
    var datas : [DataResponse] = []
    var data: DataResponse? 
    var array : [NmPnm] = []
    var header : PageResultCode = PageResultCode(pageNo: "", resultCode: "")
    
    func divideData(data: DataResponse){
        self.data = data
        self.array = data.array
        self.header = data.header
    }
    
}
