//
//  MTCharacter.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 23.04.2023.
//

import Foundation

struct MTData: Codable {
    let data: Subdata
}

struct Subdata: Codable {
    let results: [MTCharacter]
}

struct MTCharacter: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let thumbnail: Thumbnail?
    // let comics: ComicList?
}

struct Thumbnail: Codable {
    let path: String?
    let extensionValue: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionValue = "extension"
    }
}

struct ComicList: Codable {
    let collectionURI: String?
    let items: [ComicListItem]
}

struct ComicListItem: Codable {
    let resourceURI: String?
    let name: String?
}
