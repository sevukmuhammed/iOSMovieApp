//
//  DetailPageViewController.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import RxSwift

final class DetailPageViewController: BaseViewController, DetailPageStoryboardLoadable {
    
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailPlot: UILabel!
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var imdbVotes: UILabel!
    @IBOutlet weak var languages: UILabel!
    @IBOutlet weak var boxOffice: UILabel!
    @IBOutlet weak var production: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var released: UILabel!
    
    
    var disposeBag: DisposeBag!
    var viewModel: DetailPageViewModel!
    var movieName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner()
        setNavigationBar()
        viewModel.getData(title: movieName)
        subscribeViewModel()
    }
    
    func setNavigationBar() {
        self.title = movieName
    }
}

