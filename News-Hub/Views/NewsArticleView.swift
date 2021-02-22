//
//  NewsArticleView.swift
//  News-Hub
//
//  Created by ESHITA on 09/02/21.
//

import SwiftUI
import URLImage

struct NewsArticleListView: View {
    let news: [ArticleViewModel]
    var body: some View {
        listView
    }
    @ViewBuilder
        var listView: some View {
            if news.isEmpty {
                emptyListView
            } else {
                newsArticleListView
            }
        }
    
    var emptyListView: some View {
        return VStack{
            HStack(alignment: .center) {
                Text("Oops, loos like there's no data...").foregroundColor(Color.black).font(.custom("Times New Roman",size:20))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top:1, leading:10, bottom: 0, trailing:0))
                
            }.offset(x:50, y:-330)
        }
       }
       var newsArticleListView: some View {
    List {
            ForEach(self.news, id: \.title){article in
                    NewsArticleView(newsArticles: article)
            }.listRowBackground(Color.init(red: 200/255, green: 212/255, blue: 235/255))
    }
       }
}

struct NewsArticleView: View {
    
    let screenSize = UIScreen.main.bounds.size
    
    let newsArticles: ArticleViewModel

    var body: some View {
    
        return VStack{
            HStack(alignment: .center) {
                VStack(alignment: .leading){
                    Text(newsArticles.title).foregroundColor(Color.black).font(.custom("Times New Roman",size:20))
                        .fontWeight(.bold).padding(EdgeInsets(top:1, leading:10, bottom: 0, trailing:0))
                    Text(newsArticles.description)
                        .font(.custom("Times New Roman", size:14))
                        .foregroundColor(Color.black)
                        .fontWeight(.none)
                        .padding(EdgeInsets(top:1, leading: 10, bottom: 0, trailing:0))
                    Text("\(WebService().convertdteFormat(inputDate: newsArticles.publishedAt))")
                        .font(.custom("Times New Roman", size:14))
                        .foregroundColor(Color.black)
                        .fontWeight(.none)
                        .padding(EdgeInsets(top:1, leading: 10, bottom: 0, trailing:0))
                }
                Spacer()
                URLImage(url: URL(string: newsArticles.urlToImage)! ,content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }).frame(width:140.0, height:100.0)
                .padding(EdgeInsets(top:0, leading: 0, bottom: 0, trailing:10))
                
            }.background(Color.init(red: 200/255, green: 212/255, blue: 235/255))
            
        }
        .background(Color.init(red: 200/255, green: 212/255, blue: 235/255))
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = NewsItems(title: "News Title", description: "The WallStreet Journal", urlToImage: "https://prod.static9.net.au/_/media/2019/09/02/10/36/nine_news_melbourne_1600x900_fullstory_nightly6pm.jpg", publishedAt: "2021-02-08T14:15:00Z")
        //2021-02-08T14:15:00Z
        ///let article = NewsItems(title: "", description: "", urlToImage: "", publishedAt: "")
        return NewsArticleListView(news: [ArticleViewModel(article: article)])
            
    }
}
