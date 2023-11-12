//
//  LoginScreen.swift
//  LoginFeature
//
//  Created by 유상 on 11/4/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import ComposableArchitecture
import Foundation
import SwiftUI

public struct LoginScreen: Reducer, Equatable {
    public enum State: Equatable, Identifiable {
        case login(LoginCore.State)
        case nickname(NicknameCore.State)
        
        public var id: UUID {
            switch self {
            case .login(let state):
                return state.id
            case .nickname(let state):
                return state.id
            }
            
        }
    }
    
    public enum Action: Equatable {
        case login(LoginCore.Action)
        case nickname(NicknameCore.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.login, action: /Action.login) {
            LoginCore()
        }
        Scope(state: /State.nickname, action: /Action.nickname) {
            NicknameCore()
        }
    }
}
