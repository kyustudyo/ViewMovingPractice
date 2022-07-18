//
//  MyModel.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let url: String
}


struct DataResponse : Decodable,Equatable {
    let id : Int = 0
    let array : [NmPnm]
    let header : PageResultCode
    
    enum CodingKeys: String, CodingKey {
        case array = "data"
        case header = "header"
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        
        return lhs.id == rhs.id
    }
}

struct NmPnm : Decodable {
    let cmpyNm : String
    let rprsvPnm : String
}

struct PageResultCode : Decodable {
    let pageNo : String
    let resultCode : String
}
