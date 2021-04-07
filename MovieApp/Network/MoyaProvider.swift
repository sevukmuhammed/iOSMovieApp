//
//  MoyaProvider.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import Moya

let apiKey = "ac7ef994"

let provider: MoyaProvider<API> = {
    return MoyaProvider<API>.init(plugins: [NetworkLoggerPlugin()])
}()


enum API {
    case search(_ term: String)
    case getDetail(_ title: String)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "http://www.omdbapi.com/")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "sample".data(using: .utf8) ?? Data()
    }
    
    var task: Task {
        switch self {
        case .search(let term):
            return .requestParameters(parameters: [
                                        "s": term,
                                        "apikey": apiKey
                                        ], encoding: URLEncoding.queryString)
        case .getDetail(let title):
            return .requestParameters(parameters: ["t" : title,
                                                   "apikey": apiKey
                                        ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "*/*"]
    }
    
    
}

