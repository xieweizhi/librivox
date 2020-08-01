//
//  AudioResult.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation

struct AudioResult: Decodable {
    var result: [Audio]
}

struct Audio: Decodable, Hashable {
    var name: String
    var source: String
    var size: String?
    var creator: String?
    var track: String?
    var album: String?
    var format: String?
    var title: String?
    var mtime: String?
    var artist: String?
    var genre: String?
}
