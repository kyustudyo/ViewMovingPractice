//
//  NewsViewModel.swift
//  forpractice
//
//  Created by Hankyu Lee on 2022/07/18.
//

import Foundation

final class NewsViewModel {
    
    var news: ObservableObject<ArticleList?> = ObservableObject(nil)
    
    func getNews() {
        let articleUrl = Constants.URLs.articleURL
        let articleResource = Resource<ArticleList>(url: articleUrl) { data in
            let data = try? JSONDecoder().decode(ArticleList.self, from: data)
            return data
        }
        
        Webservice().load(resource: articleResource) { [weak self] result in
            if let data = result, let this = self {
                this.news.value = data
            }
        }
        
    }
    
}

final class ObservableObject<T> {
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    var listener: ((T) -> Void)?
    
    func bind(_ listener: @escaping (T) -> Void) {
        self.listener = listener
    }
}
