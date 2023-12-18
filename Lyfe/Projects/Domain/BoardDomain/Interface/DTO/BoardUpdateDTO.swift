//
//  BoardUpdateDTO.swift
//  BoardDomainInterface
//
//  Created by 송형욱 on 12/18/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation

extension BoardsDTO {
    public enum Update {}
}


// MARK: - Request
extension BoardsDTO.Update {
    public struct Request: Encodable {
        public var title: String
        public var content: String
    }
}

// MARK: - Response
extension BoardsDTO.Update {
    public struct Response: Decodable {
        public let result: Result
    }

    public struct Result: Decodable {
        public let id: Int
    }
}
