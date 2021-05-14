//
//  ImageViewController.swift
//  MvcExample
//
//  Created by swamnx on 3.05.21.
//

import Foundation
import UIKit
class ImageViewController: UIViewController {

    @IBOutlet weak var versionImage: UIImageView!
    var presenter: ImagePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }

}
extension ImageViewController: ImageView {
    
    func showImage(image: UIImage) {
        versionImage.image = image
        versionImage.setNeedsDisplay()
    }
}
