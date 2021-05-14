//
//  VersionInfoPresenter.swift
//  MvpExample
//
//  Created by swamnx on 14.05.21.
//

import Foundation
import UIKit.UIImage

class VersionHistoryPresenter {
    
    var versionHistoryView: VersionHistoryView?
    var versionInfoService: VersionInfoService!
    
    func attachView(view: VersionHistoryView) {
        versionHistoryView = view
    }
   
    func detachView() {
        versionHistoryView = nil
    }
    
    func viewDidLoad() {
        guard let verionInfos = versionInfoService.loadVersionInfos() else {return}
        versionHistoryView?.updateVersionHistoryWith(data: verionInfos)
    }
    
    func cellClicked(data: UIImage?) {
        guard let image = data else {return}
        versionHistoryView?.openImage(image)
    }
    
}
