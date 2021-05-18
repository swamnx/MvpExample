//
//  TableViewController.swift
//  MvcExample
//
//  Created by swamnx on 29.04.21.
//

import Foundation
import UIKit

class VersionHistoryController: UIViewController {

    @IBOutlet weak var versionHistoryView: UITableView!
    var versionHistory: [VersionInfo]?
    var presenter: VersionHistoryPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionHistoryView.delegate = self
        versionHistoryView.dataSource = self
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellClicked(data: versionHistory?[indexPath.row].logoImage)
    }

}
extension VersionHistoryController: VersionHistoryView {
    
    func updateVersionHistoryWith(data: [VersionInfo]) {
        versionHistory = data
        versionHistoryView.reloadData()
    }
    
    func openImage(_ image: UIImage) {
        guard let fullImageViewController = self.storyboard!.instantiateViewController(withIdentifier: "FullImageViewController") as? FullImageViewController else {return}
        fullImageViewController.presenter = FullImagePresenter(image: image)
        self.present(fullImageViewController, animated: true, completion: nil)
    }
    
    func showBasicErrorAlert(message: String) {
        let alert = UIAlertController(title: CommonUtils.ErrorTexts.basicErrorTitle.rawValue,
                                    message: message,
                                    preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: CommonUtils.ActionTexts.ok.rawValue, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension VersionHistoryController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return versionHistory?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommonUtils.VersionInfoIds.cell.rawValue, for: indexPath)
        let versionInfo = versionHistory?[indexPath.row]
        cell.textLabel?.text = versionInfo?.codeName
        cell.detailTextLabel?.text = versionInfo?.version
        if let versionImage = versionInfo?.logoImage {
            cell.imageView?.image = versionImage
        } else {
            cell.imageView?.image = UIImage.remove
        }
        return cell
    }
}
