//
//  CoordinatorProtocol.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import UIKit
import Swinject

public protocol AppScene {
    var identifier: String { get }
    var name: String { get }
    var coordinator: BaseCoordinator.Type{ get }
}

public protocol CoordinatorProtocol: AnyObject {
    func navigate(scene: AppScene, data: Any)
    func back(_ viewController: UIViewController)
    var container: Container { get }
    func start(_ scene: AppScene, data: Any)
}

