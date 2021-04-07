//
//  MainPageViewController+Subscribe.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import RxCocoa
import RxSwift

extension MainPageViewController {
    func subscribeAll() {
        subscribeViewModel()
        subscribeForRequest()
    }
    
    func subscribeViewModel() {
        self.viewModel
            .behaviorRelay
            .subscribe(onNext: { value in
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
        
        self.viewModel
            .isError
            .subscribe(onNext: { error in
                self.showAlert(message: error)
        }).disposed(by: disposeBag)
    }
    
    func subscribeForRequest() {
        self.searchSubject
            .subscribe(onNext: { value in
                self.viewModel.getData(term: value)
        }).disposed(by: disposeBag)
        
    }
    
}
