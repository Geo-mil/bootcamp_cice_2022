//
//  ImageLoader.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI
import UIKit
import FirebaseStorage

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache
    
    func loadImage(whit url: URL) {
        let urlString = url.absoluteString
        let storage = Storage.storage()// añadido para descargar de firebase storage
        let imageRef = storage.reference(forURL: urlString)// añadido para descargar de firebase storage
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            
            imageRef.getData(maxSize: 1 * 1024 * 1024){ data, error in // añadido para descargar de firebase storage
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        if let dataUnw = data {
                            guard let image = UIImage(data: dataUnw) else { return }
                            self.imageCache.setObject(image, forKey: urlString as AnyObject)
                            DispatchQueue.main.async { [weak self] in
                                self?.image = image
                            }
                        }
                    }
                }
            
//            do {
//                let data = try Data(contentsOf: url)
//                guard let image = UIImage(data: data) else {
//                    return
//                }
//                self.imageCache.setObject(image, forKey: urlString as AnyObject)
//                DispatchQueue.main.async { [weak self] in
//                    self?.image = image
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
        }
    }
}
