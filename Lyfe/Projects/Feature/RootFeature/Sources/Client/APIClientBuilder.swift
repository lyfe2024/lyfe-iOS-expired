//
//  APIClientBuilder.swift
//  RootFeature
//
//  Created by 송형욱 on 12/18/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import Dependencies
import BaseDomain
import BoardDomain
import CommentDomain
import UserDomain

extension DependencyValues {
    
    // MARK: - Common API
    public var commonClient: CommonClient {
        get { self[CommonClient.self] }
        set { self[CommonClient.self] = newValue }
    }
    
    // MARK: - Board API
    public var boardClient: BoardClient {
        get { self[BoardClient.self] }
        set { self[BoardClient.self] = newValue }
    }
    
    // MARK: - Comment API
    public var commentClient: CommentClient {
        get { self[CommentClient.self] }
        set { self[CommentClient.self] = newValue }
    }
    
    // MARK: - Comment API
    public var userClient: UserClient {
        get { self[UserClient.self] }
        set { self[UserClient.self] = newValue }
    }
}
