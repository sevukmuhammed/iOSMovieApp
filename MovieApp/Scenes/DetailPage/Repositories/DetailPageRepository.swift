//
//  DetailPageRepository.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import RxSwift

final class DetailPageRepository {
    
    func getDetail<T>(_ dump: T.Type, title: String) -> Observable<T> where T : Decodable, T : Encodable {
        return provider.rx
            .request(.getDetail(title))
            .observeOn(MainScheduler.instance)
            .map(T.self)
            .asObservable()
    }
    
}
