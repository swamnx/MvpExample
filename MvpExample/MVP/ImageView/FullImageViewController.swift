//
//  ImageViewController.swift
//  MvcExample
//
//  Created by swamnx on 3.05.21.
//

import Foundation
import UIKit
class FullImageViewController: UIViewController {

    @IBOutlet weak var versionImage: UIImageView!
    var presenter: FullImagePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }

}
extension FullImageViewController: FullImageView {
    
    func showImage(image: UIImage) {
        versionImage.image = image
        versionImage.setNeedsDisplay()
    }
}
