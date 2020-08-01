//
//  DocsResponse.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation

struct DocsResponse<T: Decodable>: Decodable {
    var responseHeader: ResponseHeader
    var response: Response
 
    struct Response: Decodable {
        var numFound: Int
        var start: Int
        var docs: [T]
    }
}

extension DocsResponse {
    var docs: [T] {
        return response.docs
    }
}


struct ResponseHeader: Decodable {
    var status: Int
    var QTime: Int
}
