//
//  UIImageView+Ext.swift
//  TopTen
//
//  Created by Muhammad Ihsan Maula on 13/04/23.
//

import UIKit

extension UIImageView {
    func loadUrl(from url: URL) {
        contentMode = .scaleAspectFit
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            }.resume()
        }
    
    func loadUrl(from link: String) {
        guard let url = URL(string: link) else { return }
        loadUrl(from: url)
    }
}
