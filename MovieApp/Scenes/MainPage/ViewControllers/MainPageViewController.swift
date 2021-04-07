//
//  MainPageViewController.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import RxSwift
import RxCocoa
import Swinject

final class MainPageViewController: BaseViewController, MainPageStoryboardLoadable {
    
    var viewModel: MainPageViewModel!
    var disposeBag: DisposeBag!
    var container: Container!
    var searchSubject = BehaviorRelay<String>(value: "")
    var searchBar = UITextField()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.showSplash()
        self.showSpinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            self.removeSpinner()
        }
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.subscribeAll()
        self.setupNavigationBarButtons()
        self.bindCollectionView()
        self.collectionView.keyboardDismissMode = .onDrag
        
        
    }

    func setupNavigationBarButtons() {
        let navigationView = SearchNavigationView.loadFromNib()
        navigationView.searchSubject = self.searchSubject
        searchBar = navigationView.textField
        self.navigationItem.titleView = navigationView
        self.navigationController?.navigationBar.barTintColor = .white
        
    }
}
