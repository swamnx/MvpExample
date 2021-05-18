//
//  Constants.swift
//  MvcExample
//
//  Created by swamnx on 3.05.21.
//

import Foundation

struct CommonUtils {
    
    enum HistoryFileProperties: String {
        case name = "macos"
        case format = "json"
    }
    
    enum VersionInfoIds: String {
        case cell = "VersionInfoCellID"
        case fullInfoSegue = "ShowFullImage"
    }
    
    enum ErrorTexts: String {
        case decodingError = "Something went wrong with decoding info to"
        case readingError = "Something went wrong while reading: "
        case basicErrorTitle = "Something went wrong"
        case noImage = "Sorry, we couldn't find image, that you selected"
        
        static func decodingErrorTextWith(modelName: String) -> String {
            return ErrorTexts.decodingError.rawValue + String(describing: modelName)
        }
        static func readingErrorTextWith(fileName: String, fileFormat: String) -> String {
            return ErrorTexts.readingError.rawValue + fileName + fileFormat
        }
    }
    enum ActionTexts: String {
        case ok = "Ok"
    }
    
    static let jsonDecoder = JSONDecoder()
}
