//
//  APIClientBuilder.swift
//  RootFeature
//
//  Created by 송형욱 on 12/18/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import Dependencies
import BoardDomain

extension DependencyValues {
    
    // MARK: - Board API
    public var boardClient: BoardClient {
        get { self[BoardClient.self] }
        set { self[BoardClient.self] = newValue }
    }
}
