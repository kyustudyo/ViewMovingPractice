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
                     completion(resource.parse(data))// T? 가 나오므로.
                }
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
    
    
    
    
}
