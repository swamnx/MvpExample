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
        guard let imageViewController = self.storyboard!.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController else {return}
        imageViewController.presenter = ImagePresenter(image: image)
        self.present(imageViewController, animated: true, completion: nil)
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
