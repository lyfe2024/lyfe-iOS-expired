//
//  EndPointProvider.swift
//  NetworkingInterface
//
//  Created by 송형욱 on 2023/09/21.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation

public enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

public protocol EndPointProvider {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var token: String { get }
    var queryItems: [URLQueryItem]? { get }
    var body: [String: Any]? { get }
    var mockFile: String? { get }
}

extension EndPointProvider {
    var scheme: String {
        return "https"
    }

    var baseURL: String {
        let baseURL = Bundle.module.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        return "\(baseURL)/"
    }

    func asURLRequest() throws -> URLRequest {

        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host =  baseURL
        urlComponents.path = path
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        guard let url = urlComponents.url else {
            throw ApiError(errorCode: "ERROR-0", message: "URL error")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("true", forHTTPHeaderField: "X-Use-Cache")

        if !token.isEmpty {
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        if let body = body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw ApiError(errorCode: "ERROR-0", message: "Error encoding http body")
            }
        }
        return urlRequest
    }
}

private class BundleFinder {}

extension Foundation.Bundle {
    /// Since Lyfe is a application, the bundle for classes within this module can be used directly.
    static let module = Bundle(for: BundleFinder.self)
}
