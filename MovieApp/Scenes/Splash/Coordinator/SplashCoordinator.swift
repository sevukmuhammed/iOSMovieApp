//
//  SplashCoordinator.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import Swinject
import RxSwift

public enum SplashScene: String, AppScene {
    
    case splash = "splash"
    
    public var identifier: String {
        return "Splash"
    }
    
    public var name: String {
        return self.rawValue
    }
    
    public var coordinator: BaseCoordinator.Type {
        return SplashCoordinator.self
    }
}

final class SplashCoordinator: BaseCoordinator {
    override func start(_ scene: AppScene, data: Any) {
        viewController = container.resolveViewController(SplashViewController.self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

