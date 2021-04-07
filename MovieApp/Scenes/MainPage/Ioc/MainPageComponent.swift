//
//  MainPageComponent.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import RxSwift

final class MainPageComponent {
    static func register(_ container: Container) {
        
        container.autoregister(MainPageViewModel.self, initializer: MainPageViewModel.init)
        container.autoregister(MainPageRepository.self, initializer: MainPageRepository.init)
        
        container.storyboardInitCompleted(MainPageViewController.self) { r, c in
            c.disposeBag = r.resolve(DisposeBag.self)
            c.viewModel = r.resolve(MainPageViewModel.self)
            c.container = container
        }
    }
}

