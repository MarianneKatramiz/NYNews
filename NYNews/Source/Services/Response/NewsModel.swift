//
//  NewsModel.swift
//  NYNews
//
//  Created by Marianne Katramiz on 11/17/20.
//

import Foundation

struct NewsModel: Codable {
    let results: [NewsDetailModel]?
}

struct NewsDetailModel: Codable {
    let id: Int?
    let title: String?
    let url: String?
    let type: String?
    let byline: String?
    let description: String?
    let published_date: String?
    let source: String?
    let media: [NewsMediaModel]?
}

struct NewsMediaModel: Codable {
    let type: String?
    let subType: String?
    let caption: String?
    let copyright: String?
    let approved: Int?
    let mediaMetadata: [MediaMetadataModel]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case subType
        case caption
        case copyright
        case approved
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadataModel: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}

enum format_media: String {
    case standard_Thumbnail = "Standard Thumbnail"
    case medium210 = "mediumThreeByTwo210"
    case medium440 = "mediumThreeByTwo440"
}
