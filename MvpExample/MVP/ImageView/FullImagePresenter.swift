//
//  ImageViewPresenter.swift
//  MvpExample
//
//  Created by swamnx on 14.05.21.
//

import Foundation
import UIKit.UIImage

class FullImagePresenter {
    
    var image: UIImage
    var view: FullImageView?
    
    init (image: UIImage) {
        self.image = image
    }
    
    func attachView(view: FullImageView) {
        self.view = view
    }
   
    func detachView() {
        view = nil
    }
    
    func viewDidLoad() {
        view?.showImage(image: image)
    }
    
}
    
