//
//  LogManager.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 7.04.2021.
//

import Foundation
import FirebaseAnalytics

enum logEventType: String {
    case open = "open"
    case click = "click"
    case response = "response"
}

public class LogManager {
    
    public static var shared: LogManager = LogManager()
    
    public static func getInstance() -> LogManager{
        return LogManager.shared
    }
    
    func logEvent(data: DetailModel) {
        Analytics.logEvent("detailData", parameters: [
            "title": (data.title ?? "") as String,
            "year": (data.year ?? "") as String,
            "rated": (data.rated ?? "") as String,
            "released": (data.released ?? "") as String,
            "director": (data.director ?? "") as String,
            "writer": (data.writer ?? "") as String,
            "language": (data.language ?? "") as String,
            "country": (data.country ?? "") as String,
            "awards": (data.awards ?? "") as String,
            "poster": (data.poster ?? "") as String,
            "imdbRating": (data.imdbRating ?? "") as String,
            "imdbVotes": (data.imdbVotes ?? "") as String,
            "imdbID": (data.imdbID ?? "") as String,
            "type": (data.type ?? "") as String,
            "boxOffice": (data.boxOffice ?? "") as String
        ])
    }
    
}

