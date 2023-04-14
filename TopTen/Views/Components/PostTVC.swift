//
//  PostTVC.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

class PostTVC: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var itemSize: CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let numberVisualItem: CGFloat = 1.4
        var itemWidth: CGFloat = (screenWidth - (numberVisualItem - 1)
                                  * Space.x8.rawValue) / numberVisualItem
        itemWidth -= Space.x16.rawValue
        return CGSize(width: itemWidth, height: 150)
    }
    
    private var postList: [PostModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = L.top_ten_posts
        renderCollectionView()
    }
    
    func setup(_ list: [PostModel]) {
        postList = list
        collectionView.reloadData()
    }
    
    func renderCollectionView() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PostItemCVC",
                                      bundle: nil),
                                forCellWithReuseIdentifier: "PostItemCVC")
    }
}

extension PostTVC: UICollectionViewDataSource,
                    UICollectionViewDelegate,
                    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return postList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let post = postList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostItemCVC",
                                                      for: indexPath) as! PostItemCVC
        cell.setup(title: post.title, body: post.body)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
}
