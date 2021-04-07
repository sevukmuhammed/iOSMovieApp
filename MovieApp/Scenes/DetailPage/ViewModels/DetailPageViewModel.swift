//
//  DetailPageViewModel.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import RxSwift
import RxCocoa

final class DetailPageViewModel: BaseViewModel {
    
    private var repository: DetailPageRepository!
    var behaviorRelay = BehaviorRelay<DetailModel>(value: DetailModel())
    
    init(disposeBag: DisposeBag, DetailPageRepository: DetailPageRepository) {
        super.init()
        self.disposeBag = disposeBag
        self.repository = DetailPageRepository
    }
    
    func getData(title: String) {
        self.repository.getDetail(DetailModel.self, title: title).subscribe(onNext: { data in
            self.behaviorRelay.accept(data)
        }, onError: { error in
            print("Error => \(error.localizedDescription)")
        }).disposed(by: disposeBag)
    }
}


