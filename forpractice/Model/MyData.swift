//
//  MyModel.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation

struct MyData : Decodable,Equatable {
    let id : Int = 0
    let array : [Two]
    let header : Two2
    
    enum CodingKeys: String, CodingKey {
        case array = "data"
        case header = "header"
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        
        return lhs.id == rhs.id
    }
}

struct Two : Decodable {
    let cmpyNm : String
    let rprsvPnm : String
}
struct Two2 : Decodable {
    let pageNo : String
    let resultCode : String
}
