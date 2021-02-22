//
//  ArticleListViewModel.swift
//  News-Hub
//
//  Created by ESHITA on 09/02/21.
//

import Foundation
import SwiftUI

class ArticleListViewModel: ObservableObject  {
    @Published var searchTerm: String = ""
    @Published var news: [ArticleViewModel] = [ArticleViewModel]()
    
    func load() {
        fetchNews()
    }
    
    private func fetchNews() {
        WebService().getTopNews{ article in
            if let article = article {
              //  self.articleListVM = ArticleListViewModel(articles: articles)
               
                self.news = article.map(ArticleViewModel.init)
            }
        }
    }
}
