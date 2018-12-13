//
//	Playlist.swift
//  RadioStations
//
//  Created by Allan Evans on 11/17/18.
//  Copyright © 2018 lingo-slingers.org. All rights reserved.
//


import Foundation

struct Playlist : Codable {

	let format : String?
	let quality : String?
	let url : String?

	enum CodingKeys: String, CodingKey {
		case format = "format"
		case quality = "quality"
		case url = "url"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		format = try values.decodeIfPresent(String.self, forKey: .format)
		quality = try values.decodeIfPresent(String.self, forKey: .quality)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}


}
