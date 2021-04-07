//
//  SplashStoryboardLoadable.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import UIKit

public protocol SplashStoryboardLoadable: StoryboardLoadable {}

extension SplashStoryboardLoadable where Self: UIViewController {
    @nonobjc static var storyboardName: String {
        return "Splash"
    }
}

