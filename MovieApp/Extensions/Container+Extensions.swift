//
//  Container+Extensions.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension Container {
    public func resolveViewController<ViewController: StoryboardLoadable>(_ serviceType: ViewController.Type) -> ViewController {
        let sb = SwinjectStoryboard.create(name: serviceType.storyboardName, bundle: nil,container: self)
        let name = "\(serviceType)".replacingOccurrences(of: "ViewController", with: "")
        return sb.instantiateViewController(withIdentifier: name) as! ViewController
    }
}
