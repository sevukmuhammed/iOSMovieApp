//
//  DetailPageComponent.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import Swinject
import RxSwift
import SwinjectAutoregistration

final class DetailPageComponent {
    
    static func register(_ container: Container){
        
        container.autoregister(DetailPageViewModel.self, initializer: DetailPageViewModel.init)
        container.autoregister(DetailPageRepository.self, initializer: DetailPageRepository.init)
        
        container.storyboardInitCompleted(DetailPageViewController.self) { r, c in
            c.viewModel = r.resolve(DetailPageViewModel.self)
            c.disposeBag = r.resolve(DisposeBag.self)
        }
    }
}


