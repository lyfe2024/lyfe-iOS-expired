//
//  LoginCoordinator.swift
//  LoginFeatureInterface
//
//  Created by 유상 on 10/27/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct LoginCoordinator: Reducer {
    
    init() {}
    
    struct State: Equatable {
        var nickname: String?
    }
    
    enum Action: Equatable {
        case join
    }
    
    
    private func join() {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .join:
                return .none
            }
        }
    }
}

