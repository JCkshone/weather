//
//  Url.swift
//  Weather
//
//  Created by Juan Camilo Navarro Alvira on 5/07/21.
//

import Foundation

extension URL {
    func addQueryItems(query: [String: String]) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        
        for (key, value) in query {
            queryItems.append(URLQueryItem(name: key, value: value))
        }

        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
