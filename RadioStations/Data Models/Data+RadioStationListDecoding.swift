//
//  Data+Decoding.swift
//  RadioStations
//
//  Created by Allan Evans on 12/1/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//

import Foundation

extension Data {
    func decodeRadioStationData() -> RadioStationList {
        let decoder = JSONDecoder()
        guard let radioStationList = try? decoder.decode(RadioStationList.self, from: self) else {
            fatalError("Unable to decode JSON data")
        }
        return radioStationList
    }
}
