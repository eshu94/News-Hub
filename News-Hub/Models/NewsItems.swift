//
//  NewsItems.swift
//  News-Hub
//
//  Created by ESHITA on 09/02/21.
//

import Foundation

struct NewsItemsList: Decodable {
    let articles: [NewsItems]
}
struct NewsItems: Decodable {
    
    let title: String
    let description: String
    let urlToImage: String
    let publishedAt: String
}
