//
//  PostItemCVC.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

class PostItemCVC: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardView()
    }
    
    func setupCardView() {
        cardView.layer.cornerRadius = 10
    }
    
    func setup(title: String, body: String) {
        titleLabel.text = title
        bodyLabel.text = body
    }
}
