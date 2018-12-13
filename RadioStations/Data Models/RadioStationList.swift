//
//	RadioStationList.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct RadioStationList : Codable {

	let channels : [Channel]?


	enum CodingKeys: String, CodingKey {
		case channels = "channels"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		channels = try values.decodeIfPresent([Channel].self, forKey: .channels)
	}


}