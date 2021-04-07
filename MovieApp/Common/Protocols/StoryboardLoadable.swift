//
//  StoryboardLoadable.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation

public protocol StoryboardLoadable: AnyObject {
    @nonobjc static var storyboardName: String { get }
}
