//
//  ImageViewPresenter.swift
//  MvpExample
//
//  Created by swamnx on 14.05.21.
//

import Foundation
import UIKit.UIImage

class ImagePresenter {
    
    var image: UIImage
    var imageView: ImageView?
    
    init (image: UIImage) {
        self.image = image
    }
    
    func attachView(view: ImageView) {
        imageView = view
    }
   
    func detachView() {
        imageView = nil
    }
    
    func viewDidLoad() {
        imageView?.showImage(image: image)
    }
    
}
    
