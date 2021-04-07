//
//  MainPageRepository.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import RxSwift

final class MainPageRepository {
    
    func getSearchResults<T>(_ dump: T.Type, term: String) -> Observable<T> where T : Decodable, T : Encodable {
        return provider.rx
            .request(.search(term))
            .observeOn(MainScheduler.instance)
            .map(T.self)
            .asObservable()
    }
    
}


