//
//  ArticleViewModel.swift
//  News-Hub
//
//  Created by ESHITA on 09/02/21.
//

import Foundation
struct ArticleViewModel: Decodable {
    
    let article: NewsItems
    
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description
    }
    var urlToImage: String {
        return self.article.urlToImage
    }
    
    var publishedAt: String{
        return self.article.publishedAt
    }
}
