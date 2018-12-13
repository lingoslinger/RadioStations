//
//	Channel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Channel : Codable {

	let descriptionField : String?
	let dj : String?
	let djmail : String?
	let genre : String?
	let id : String?
	let image : String?
	let largeimage : String?
	let lastPlaying : String?
	let listeners : String?
	let playlists : [Playlist]?
	let title : String?
	let twitter : String?
	let updated : String?
	let xlimage : String?


	enum CodingKeys: String, CodingKey {
		case descriptionField = "description"
		case dj = "dj"
		case djmail = "djmail"
		case genre = "genre"
		case id = "id"
		case image = "image"
		case largeimage = "largeimage"
		case lastPlaying = "lastPlaying"
		case listeners = "listeners"
		case playlists = "playlists"
		case title = "title"
		case twitter = "twitter"
		case updated = "updated"
		case xlimage = "xlimage"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		dj = try values.decodeIfPresent(String.self, forKey: .dj)
		djmail = try values.decodeIfPresent(String.self, forKey: .djmail)
		genre = try values.decodeIfPresent(String.self, forKey: .genre)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		largeimage = try values.decodeIfPresent(String.self, forKey: .largeimage)
		lastPlaying = try values.decodeIfPresent(String.self, forKey: .lastPlaying)
		listeners = try values.decodeIfPresent(String.self, forKey: .listeners)
		playlists = try values.decodeIfPresent([Playlist].self, forKey: .playlists)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		twitter = try values.decodeIfPresent(String.self, forKey: .twitter)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		xlimage = try values.decodeIfPresent(String.self, forKey: .xlimage)
	}


}