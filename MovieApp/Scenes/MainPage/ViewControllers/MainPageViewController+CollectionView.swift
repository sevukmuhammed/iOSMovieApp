//
//  MainPageViewController+CollectionView.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import Foundation
import RxCocoa
import RxSwift

extension MainPageViewController: UICollectionViewDataSource {
    
    internal func bindCollectionView() {
        registerCollectionViewCells()
        setupCollectionViewClickEvent()
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(cellType: ItemCell.self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.behaviorRelay.value.search?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.cellData = viewModel.behaviorRelay.value.search?[indexPath.row]
        return cell
    }
    
    func setupCollectionViewClickEvent() {
        collectionView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let cell = self?.collectionView.cellForItem(at: indexPath) as? ItemCell else {return}
            guard let item = cell.cellData else {return}
            self?.navigationSubject.onNext(Navigation<Any>(DetailScene.detail, data: ["data": item.title]))
        }).disposed(by: disposeBag)
    }
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 20) / 2, height: ((collectionView.frame.width - 10) / 2) * 16 / 9)
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 5
    }

}

