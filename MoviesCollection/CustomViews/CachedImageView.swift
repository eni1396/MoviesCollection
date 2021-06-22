//
//  CachedImageView.swift
//  MoviesCollection
//
//  Created by Nikita Entin on 22.06.2021.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CachedImageView: UIImageView {
    var imageUrlString: String?

    func downloadImageFrom(withUrl urlString : String) {
        imageUrlString = urlString

        guard let url = URL(string: urlString) else { return }
        image = nil

        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            image = cachedImage
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
           

            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                    if self.imageUrlString == urlString {
                        self.image = image
                    }
                imageCache.setObject(image, forKey: urlString as NSString)
            }
        }).resume()
    }
}
