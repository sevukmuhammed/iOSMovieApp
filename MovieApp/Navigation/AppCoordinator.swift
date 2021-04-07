//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import UIKit
import os.log
import Swinject
import RxSwift

enum AppMainScene: String, AppScene {
    
    case app = "app"
    case back = "back"
    
    var identifier: String {
        return "AppMain"
    }
    
    var name: String {
        return self.rawValue
    }
    
    var coordinator: BaseCoordinator.Type {
        return BaseCoordinator.self
    }
    
}

final class AppCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    let container: Container
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        NavigationService.initializeNavigationService(container, disposeBag: disposeBag, fromViewController: nil)
    }
    
    func navigate(scene: AppScene, data: Any) {
        
    }
    
    func back(_ viewController: UIViewController) {
        
    }
    
    func start(_ scene: AppScene, data: Any) {
        
        let mainViewController = container.resolveViewController(MainPageViewController.self)
        let navigationController = BaseNavigationController(rootViewController: mainViewController)
        navigationController.navigationBar.tintColor = .black
        self.window.rootViewController = navigationController
    
        
        mainViewController.navigationSubject.subscribe(onNext: { navigation in
            let mainPageCoordinator = MainPageCoordinator(container: self.container,
                                                              navigationController: navigationController,
                                                              disposeBag: self.disposeBag,
                                                              fromViewController: nil)
            
            try! NavigationService
                .requestNavigationObject()
                .start(fromViewController: mainViewController, navigationController: navigationController, prevCoordinator: mainPageCoordinator, nextScene: navigation.scene, data: navigation.data, animation: true)
            
        }).disposed(by: disposeBag)
    }
}
