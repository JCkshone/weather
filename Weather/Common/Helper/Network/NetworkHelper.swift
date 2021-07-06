//
//  NetworkHelper.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation
import Alamofire
import PromiseKit

enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

enum WeatherPropertyQuery: String {
    case query
}

class NetworkServices {
    static let share = NetworkServices()
    private var aditionalPath: AditionalPaths = .search
    private var path: Path = .location
    private let configuration: Configuration
    
    private var completePath: String {
        return otherPath == nil ?
            "\(path.rawValue)/\(aditionalPath.rawValue)" :
            "\(path.rawValue)/\(otherPath ?? "")"
    }
    
    private var baseUrl: URL? {
        var url = queryProperties.isEmpty ?
            URL(string: configuration.getValueConfiguration(withType: String.self, key: .baseUrl) ?? "") :
            URL(string: configuration.getValueConfiguration(withType: String.self, key: .baseUrl) ?? "")?
            .addQueryItems(query: queryProperties)
        url?.appendPathComponent(completePath)
        return url
    }
    
    private var headers: HTTPHeaders = HTTPHeaders()
    
    var queryProperties: [String: String] = [:]
    var otherPath: String?
    
    init() {
        self.configuration = Configuration()
    }
    
    func request<T: Codable>(path: Path = .location,
                             aditionalPath: AditionalPaths,
                             method: HTTPMethod = .get,
                             data: [String: Any]? = nil,
                             of: T.Type) -> Promise<T> {
        
        self.aditionalPath = aditionalPath
        self.path = path
        
        return Promise { seal in
            guard let url = baseUrl else {
                return seal.reject(APIServiceError.invalidEndpoint)
            }
            AF.request(url, method: method,
                       parameters: data,
                       encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { (response) in
                        switch response.result {
                        case let .success(result):
                            seal.fulfill(result)
                        case let .failure(error):
                            seal.reject(error)
                        }
                       }
        }
    }
}


