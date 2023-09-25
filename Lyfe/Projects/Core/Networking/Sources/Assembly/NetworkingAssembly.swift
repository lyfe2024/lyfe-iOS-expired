//
//  NetworkingAssembly.swift
//  NetworkingInterface
//
//  Created by 송형욱 on 2023/09/21.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import Swinject
import Networking

public final class NetworkingAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        
        // MARK: APIClient
        container.register(APIProtocol.self) { _ in
            APIClient()
        }
    }
}
