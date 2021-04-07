//
//  SearchNavigationView.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa

class SearchNavigationView: UIView, NibLoadable {
    
    @IBOutlet weak var textField: UITextField!
    var searchSubject: BehaviorRelay<String>!
    let disposeBag = DisposeBag()
    @IBOutlet weak var searchButton: UIButton!
    
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subscribeSearchButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSubject.accept(self.textField.text ?? "")
    }
    
    func subscribeSearchButton() {
        searchButton
            .rx
            .tap
            .subscribe(onNext: { _ in
                self.searchSubject.accept(self.textField.text ?? "")
        }).disposed(by: disposeBag)
    }
}



