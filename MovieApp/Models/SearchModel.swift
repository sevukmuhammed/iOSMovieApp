//
//  SearchModel.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation

struct Response: Codable {
    var search: [Search]?
    var totalResults: String?
    var response: String?
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
        case response = "Response"
        case error = "Error"
    }
}

struct Search: Codable {
    var title: String?
    var year: String?
    var imdbID: String?
    var type: String?
    var poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
