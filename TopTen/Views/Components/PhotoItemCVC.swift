//
//  PhotoItemCVC.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

class PhotoItemCVC: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCardView()
    }
    
    func setupCardView() {
        cardView.layer.cornerRadius = 10
        cardView.layer.borderColor = UIColor.systemGray4.cgColor
        cardView.layer.borderWidth = 0.5
    }

    func setup(imageUrl: String, title: String) {
        titleLabel.text = title
        imageView.loadUrl(from: imageUrl)
    }
}
