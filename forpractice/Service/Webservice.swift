//
//  Webservice.swift
//  forpractice
//
//  Created by 이한규 on 2021/11/19.
//

import Foundation
struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                     completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
//    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if let error = error {
//                print(error.localizedDescription)
//                completion(nil)
//            } else if let data = data {
//                
//                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
//                
//                if let articleList = articleList {
//                    completion(articleList.articles)
//                }
//                
//                print(articleList?.articles)
//                
//            }
//            
//        }.resume()
//        
//    }
}
