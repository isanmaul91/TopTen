//
//  PhotoTVC.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

class PhotoTVC: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var itemSize: CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let numberVisualItem: CGFloat = 2
        var itemWidth: CGFloat = (screenWidth - (numberVisualItem - 1)
                                  * Space.x8.rawValue) / numberVisualItem
        itemWidth -= Space.x16.rawValue
        return CGSize(width: itemWidth, height: 236)
    }
    
    private var photoList: [PhotoModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = L.top_ten_photos
        renderCollectionView()
    }
    
    func setup(_ list: [PhotoModel]) {
        photoList = list
        collectionView.reloadData()
    }
    
    func renderCollectionView() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PhotoItemCVC", bundle: nil),
                                forCellWithReuseIdentifier: "PhotoItemCVC")
    }
}

extension PhotoTVC: UICollectionViewDataSource,
                        UICollectionViewDelegate,
                        UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = photoList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoItemCVC",
                                                      for: indexPath) as! PhotoItemCVC
        cell.setup(imageUrl: data.thumbnailUrl, title: data.title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
}
