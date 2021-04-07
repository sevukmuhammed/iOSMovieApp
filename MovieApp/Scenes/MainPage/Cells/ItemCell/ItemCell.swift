//
//  ItemCell.swift
//  MovieApp
//
//  Created by Muhammed Sevük on 5.04.2021.
//

import UIKit
import Reusable
import Kingfisher

class ItemCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearView: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    
    var cellData: Search? {
        didSet{
            guard let data = cellData else { return }
            if data.poster == "N/A" || data.poster == "" {
                cellImage.contentMode = .scaleAspectFit
                cellImage.image = UIImage(named: "box")
                
            } else {
                cellImage.contentMode = .scaleAspectFill
                cellImage.kf.setImage(with: URL(string: data.poster ?? ""))
            }
            
            titleLabel.text = data.title ?? ""
            yearLabel.text = data.year ?? ""
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setRadius(view: yearView)
    }
    
    func setRadius(view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        self.contentView.addSubview(view)
    }

}
