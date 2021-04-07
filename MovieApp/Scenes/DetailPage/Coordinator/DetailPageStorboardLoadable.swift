//
//  DetailPageStorboardLoadable.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import UIKit
import Foundation

public protocol DetailPageStoryboardLoadable: StoryboardLoadable {}

extension DetailPageStoryboardLoadable where Self: UIViewController {
  @nonobjc static var storyboardName: String {
        return "DetailPage"
    }
}


