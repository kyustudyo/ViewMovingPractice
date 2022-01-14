//
//  MyModelViewModel.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation

struct MyModelViewModel {
    private let manager = MyModelManager.shared
    var datas : [MyData] {
        return manager.datas
    }
    var array : [Two] {
        return manager.array
    }
    var header : Two2 {
        return manager.header
    }
    
    func addMydata(data:MyData){
        manager.addMydata(data: data)
    }
    func divideData(data:MyData){
        manager.divideData(data: data)
    }
    
}

class MyModelManager {
    static let shared = MyModelManager()
    static var lastId :Int = 0
    var datas : [MyData] = []
    var array : [Two] = []
    var header : Two2 = Two2(pageNo: "", resultCode: "")
    func addMydata(data:MyData){
        datas.append(data)
    }
    
    func divideData(data:MyData){
        self.array = data.array
        self.header = data.header
    }
    
}
