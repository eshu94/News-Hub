//
//  WebService.swift
//  News-Hub
//
//  Created by ESHITA on 09/02/21.
//

import Foundation

import Foundation

class WebService {
    
    func getTopNews(completion: @escaping (([NewsItems]?) -> Void)) {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=Your_API_Key") else {
                   fatalError("URL is not correct")
               }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let newsArticlesList = try? JSONDecoder().decode(NewsItemsList.self, from: data)
            
            DispatchQueue.main.async {
                if let newsArticlesList = newsArticlesList {
                    print(newsArticlesList.articles)
                    completion(newsArticlesList.articles)
                }
            }
            
        }.resume()
        
        
    }
    
    func convertdteFormat(inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
   
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let oldDate = olDateFormatter.date(from: inputDate)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "MMM dd, yyyy HH:mm a"
         return convertDateFormatter.string(from: oldDate!)
    }
}
