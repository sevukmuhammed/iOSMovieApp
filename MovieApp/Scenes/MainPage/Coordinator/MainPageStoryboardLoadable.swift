//
//  MainPageStoryboardLoadable.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import UIKit

public protocol MainPageStoryboardLoadable: StoryboardLoadable {}

extension MainPageStoryboardLoadable where Self: UIViewController {
    @nonobjc static var storyboardName: String {
        return "MainPage"
    }
}
