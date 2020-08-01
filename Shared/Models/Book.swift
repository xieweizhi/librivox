//
//  Book.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation

public struct Book: Decodable, Identifiable {
    public var creator: String?
    public var date: String?
    public var description: String
    public var downloads: Int
    public var identifier: String
    public var itemSize: Int
//    public var subject: [String]?
    public var runtime: String?
    public var title: String
    
    public var id: String {
        return identifier
    }
}

extension Book {
    var coverURL: URL? {
        URL(string: "https://archive.org/services/get-item-image.php?identifier=\(identifier)")
    }
}
