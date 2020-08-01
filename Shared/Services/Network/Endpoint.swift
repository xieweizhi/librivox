//
//  Endpoint.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation


public enum Endpoint {
    case mostDownloads
    case bookAudios(bookId: String)
    
    var path: String {
        switch self {
        case .mostDownloads:
            return "/advancedsearch.php?q=collection:(librivoxaudio)&fl=runtime,avg_rating,num_reviews,title,description,identifier,creator,date,downloads,subject,item_size&sort[]=downloads desc&rows=10&page=1&output=json"
        case .bookAudios(let id):
            return "/metadata/\(id)/files"
        }
    }
}


