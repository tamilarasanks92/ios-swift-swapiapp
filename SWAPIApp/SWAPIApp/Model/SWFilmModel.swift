//
//  SWFilmsModel.swift
//  SWAPIApp
//
//  Created by aspire on 9/16/20.
//  Copyright © 2020 aspire. All rights reserved.
//

import Foundation

// Model for StarWars films
struct SWFilmModel: Decodable {
    let title: String
    let opening_crawl: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case opening_crawl = "opening_crawl"
    }
}
