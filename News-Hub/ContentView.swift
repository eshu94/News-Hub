//
//  ContentView.swift
//  News-Hub
//
//  Created by ESHITA on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var newsListVM = ArticleListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.init(displayP3Red: 200/255, green: 212/255, blue:  235/255, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UITableView.appearance().backgroundColor =  UIColor.init(displayP3Red: 200/255, green: 212/255, blue:  235/255, alpha: 1.0)
        UITableViewCell.appearance().backgroundColor =  UIColor.init(displayP3Red: 200/255, green: 212/255, blue:  235/255, alpha: 1.0)
        
        newsListVM.load()
    }
    
    var body: some View {
        
        let filteredNews = self.newsListVM.searchTerm.isEmpty ? self.newsListVM.news: self.newsListVM.news.filter {$0.title .starts(with: self.newsListVM.searchTerm ) }

        return NavigationView {
        ZStack(alignment:.leading){
                Color.init(red: 200/255, green: 212/255, blue: 235/255)
                    .edgesIgnoringSafeArea(.all)
                SearchView(searchTerm: self.$newsListVM.searchTerm)
                    .offset(y: -330)
            NewsArticleListView(news: filteredNews)
                .offset(y:50)
            }.ignoresSafeArea(.keyboard)
        .navigationBarTitle("News-Hub")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
