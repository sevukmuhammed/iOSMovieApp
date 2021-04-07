//
//  MainPageViewModel.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

final class MainPageViewModel: BaseViewModel {
    
    private var repository: MainPageRepository!
    var behaviorRelay = BehaviorRelay<Response>(value: Response())
    var isError = PublishSubject<String>()
    
    init(disposeBag: DisposeBag, MainPageRepository: MainPageRepository) {
        super.init()
        self.disposeBag = disposeBag
        self.repository = MainPageRepository
    }
    
    func getData(term: String) {
        self.repository.getSearchResults(Response.self, term: term).subscribe(onNext: { data in
            self.behaviorRelay.accept(data)
            if data.error != nil && term.count > 0 {
                self.isError.onNext(data.error ?? "")
            }
            
        }, onError: { error in
            print("Error => \(error.localizedDescription)")
            self.isError.onNext(error.localizedDescription)
            self.behaviorRelay.accept(Response())
        }).disposed(by: disposeBag)
    }
    
}

