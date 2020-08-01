//
//  NetworkError.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation

public enum NetworkError: Error {
    case unknown(data: Data)
    case message(reason: String, data: Data)
    case parseError(reason: Error)
    
    static private let decoder = JSONDecoder()
    
    static func processResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown(data: data)
        }
        if (httpResponse.statusCode == 404) {
            throw NetworkError.message(reason: "Resource not found", data: data)
        }
        if 200 ... 299 ~= httpResponse.statusCode {
            return data
        } else {
            throw NetworkError.unknown(data: data)
        }
    }
}
