//
//  NavigationCoordinator+BaseCoordinator.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import UIKit
import RxSwift
import Swinject

extension NavigationCoordinator where Self: BaseCoordinator {
    
    func initializeNavigationService(){
        self.viewController.navigationSubject.subscribe(onNext: { (navigation) in
            try! NavigationService.requestNavigationObject()
                .start(fromViewController: self.viewController,
                       navigationController: self.navigationController,
                       prevCoordinator: self,
                       nextScene: navigation.scene,
                       data: navigation.data,
                       animation: navigation.animation)
        }).disposed(by: self.disposeBag)
    }
    
}

