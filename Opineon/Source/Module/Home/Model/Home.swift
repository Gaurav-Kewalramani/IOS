//
//  HomeModel.swift
//  Opineon
//
//  Created by Gaurav Kewalramani on 22/12/22.
//

import UIKit

 // MARK: - JSON DATA (API Structure)

struct NewsApi: Decodable {
    var status      :   String
    var totalResults:   Int
    var articles    :   [Articles]
}

struct Articles : Decodable {
    var author         :    String?
    var title          :    String?
    var publishedA     :    String?
    var content        :    String?
    var urlToImage     :    String?
    var description    :    String?
    
}
