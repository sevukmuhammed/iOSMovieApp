//
//  BaseViewController+SpinnerExtensions.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import UIKit

extension BaseViewController {
    func showSpinner() {
        self.indicatorsBack = UIView(frame: self.view.bounds)
        self.indicatorsBack?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.center = self.indicatorsBack!.center
        indicator.startAnimating()
        self.indicatorsBack?.addSubview(indicator)
        self.view.addSubview(self.indicatorsBack!)
    }
    
    func removeSpinner() {
        self.indicatorsBack?.removeFromSuperview()
        self.indicatorsBack = nil
    }
}
