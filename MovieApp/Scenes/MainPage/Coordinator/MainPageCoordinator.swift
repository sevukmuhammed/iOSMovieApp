//
//  MainPageCoordinator.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import Swinject
import RxSwift

public enum MainPageScene: String, AppScene {
    
    case mainPage = "mainPage"
    
    public var identifier: String {
        return "MainPage"
    }
    
    public var name: String {
        return self.rawValue
    }
    
    public var coordinator: BaseCoordinator.Type {
        return MainPageCoordinator.self
    }
}

final class MainPageCoordinator: BaseCoordinator {
    override func start(_ scene: AppScene, data: Any) {
        
        viewController = container.resolveViewController(MainPageViewController.self)
        navigationController.navigationItem.backBarButtonItem?.isEnabled = false;
        navigationController.navigationBar.isHidden = false
        navigationController.navigationItem.hidesBackButton = true
        //navigationController.navigationItem.setHidesBackButton(true, animated: true)
        navigationController.pushViewController(viewController, animated: true)
    }
}

