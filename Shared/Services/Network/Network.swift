//
//  Network.swift
//  librivox (iOS)
//
//  Created by weizhi.
//

import Foundation
import Combine

struct Network {
    
    static public let shared = Network()
    static private let BASE = "https://archive.org"
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        
        session = URLSession(configuration: Self.makeSessionConfiguration())
    }
    
    static private func makeSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = .shared
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        return configuration
    }
    
    static private func makeURL(endpoint: Endpoint) -> URL {
        guard let encoded = endpoint.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError()
        }
        return URL(string: BASE.appending(encoded))!
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint,
                               httpMethod: String = "GET")
    -> AnyPublisher<T, Error> {
        var request = URLRequest(url: Self.makeURL(endpoint: endpoint))
        request.httpMethod = httpMethod
       
        return session.dataTaskPublisher(for: request)
            .tryMap{ data, response in
                return try NetworkError.processResponse(data: data, response: response)
            }
            .decode(type: T.self, decoder: decoder)
            .mapError{ error in
                print("----- BEGIN PARSING ERROR-----")
                print("request: \(request), error")
                print("----- END PARSING ERROR-----")
                return NetworkError.parseError(reason: error)
            }
            .eraseToAnyPublisher()
    }
    
}
