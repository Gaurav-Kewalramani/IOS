//
//  HomeViewModel.swift
//  Opineon
//
//  Created by Gaurav Kewalramani on 22/12/22.
//

import UIKit

class HomeViewModel: NSObject {
    
   // MARK: - Parsing Json
    
    func parsingJson(completion: @escaping ([Articles]) -> ()) {
        let urlstring = "https://newsapi.org/v2/everything?q=tesla&from=2023-5-8&sortBy=publishedAt&apiKey=87451c3a130848bca16f058de7b107c3"
        let url = URL(string: urlstring)
        guard url != nil else {
            print("error")
            return
        }
        let sesion = URLSession.shared
        let dataTask = sesion.dataTask(with: url!) { data, response, error in
            if error == nil, data != nil { 
                let decoder = JSONDecoder()
                do {
                    let parsingData = try decoder.decode(NewsApi.self, from: data!)
                    // Closure calling
                    completion(parsingData.articles)
                }
                catch {
                    print("parsing error")
                }
            }
        }
        dataTask.resume()
    }
}
