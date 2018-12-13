//
//  Bundle+WebserviceDecoding.swift
//  RadioStations
//
//  Created by Allan Evans on 11/30/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//

import Foundation

extension Bundle {
    func decodeWebservicePlist(from fileName: String, fileExtension: String) -> String {
        guard let fileURL = url(forResource: fileName, withExtension: fileExtension) else {
            fatalError("Falied to locate \(fileName).\(fileExtension) in app bundle")
        }
        guard let fileData = try? Data(contentsOf: fileURL) else {
            fatalError("Failed to load \(fileName).\(fileExtension) from app bundle")
        }
        let decoder = PropertyListDecoder()
        guard let result = try? decoder.decode(WebservicePropertyList.self, from: fileData) else {
            fatalError("Failed to decode \(fileName).\(fileExtension) from app bundle")
        }
        return result.radioStationWebService
    }
}
