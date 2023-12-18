//
//  BoardWrite.swift
//  BoardDomainInterface
//
//  Created by 송형욱 on 12/18/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation

extension BoardsDTO {
    public enum Write {}
}


// MARK: - Request
extension BoardsDTO.Write {
    public struct Request: Encodable {
        public var title: String
        public var content: String
        public var boardType: BoardType
        public var userID: Int
        public var topicID: Int
    }
}

// MARK: - Response
extension BoardsDTO.Write {
    public struct Response: Decodable {
        public let result: Result
    }

    public struct Result: Decodable {
        public let id: Int
    }
}
