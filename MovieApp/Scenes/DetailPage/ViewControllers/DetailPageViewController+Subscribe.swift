//
//  DetailPageViewController+Subscribe.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 6.04.2021.
//

import Foundation
import RxSwift
import RxCocoa
import Kingfisher

extension DetailPageViewController {
    func subscribeViewModel() {
        self.viewModel
            .behaviorRelay
            .subscribe(onNext: { value in
                self.detailImage.kf.setImage(with: URL(string: value.poster ?? ""))
                self.detailPlot.text = value.plot ?? ""
                self.imdbRating.text = "IMDB Rating => " + (value.imdbRating ?? "")
                self.imdbVotes.text = "IMDB Votes => " + (value.imdbVotes ?? "")
                self.languages.text = "Languages => " + (value.language ?? "")
                self.boxOffice.text = "Box Office => " + (value.boxOffice ?? "")
                self.production.text = "Production => " + (value.production ?? "")
                self.country.text = "Country => " + (value.country ?? "")
                self.director.text = "Director => " + (value.director ?? "")
                self.released.text = "Released => " + (value.released ?? "")
                self.logManager.logEvent(data: value)
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                    self.removeSpinner()
                }
        }).disposed(by: disposeBag)
    }
}
