//
//  VersionInfoView.swift
//  MvpExample
//
//  Created by swamnx on 14.05.21.
//

import Foundation
import UIKit.UIImage

protocol VersionHistoryView {
    
    func updateVersionHistoryWith(data: [VersionInfo])
    func openImage(_ data: UIImage)
    func showBasicErrorAlert(message: String)
}
