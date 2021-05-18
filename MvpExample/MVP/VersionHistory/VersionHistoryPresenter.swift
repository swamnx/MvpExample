//
//  VersionInfoPresenter.swift
//  MvpExample
//
//  Created by swamnx on 14.05.21.
//

import Foundation
import UIKit.UIImage

class VersionHistoryPresenter {
    
    var view: VersionHistoryView?
    var versionInfoService: VersionInfoService!
    
    func attachView(view: VersionHistoryView) {
        self.view = view
    }
   
    func detachView() {
        view = nil
    }
    
    func viewDidLoad() {
        guard let verionInfos = versionInfoService.loadVersionInfos() else {return}
        view?.updateVersionHistoryWith(data: verionInfos)
    }
    
    func cellClicked(data: UIImage?) {
        if data == nil {
            view?.showBasicErrorAlert(message: CommonUtils.ErrorTexts.noImage.rawValue)
        } else {
            view?.openImage(data!)
        }
    }
    
}
