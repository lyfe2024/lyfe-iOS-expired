//
//  APIProtocol.swift
//  NetworkingInterface
//
//  Created by 송형욱 on 2023/09/21.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation

public protocol APIProtocol {
    func asyncRequest<T: Decodable>(endpoint: EndPointProvider, responseModel: T.Type) async throws -> T
    func asyncUpload<T: Decodable>(endpoint: EndPointProvider, responseModel: T.Type) async throws -> T
}
