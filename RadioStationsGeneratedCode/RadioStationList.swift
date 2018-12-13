//
//	RadioStationList.swift
//  RadioStations
//
//  Created by Allan Evans on 11/17/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//

import Foundation

struct RadioStationList : Codable {

	var channels : [Channel]?

	enum CodingKeys: String, CodingKey {
		case channels = "channels"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		channels = try values.decodeIfPresent([Channel].self, forKey: .channels)
        channels?.sort { $0.genre < $1.genre }
	}
    
    func channelsFilteredByDJ(searchText: String) -> [Channel]? {
        return channels?.filter { return $0.dj?.lowercased().contains(searchText.lowercased()) ?? false }
    }
}
