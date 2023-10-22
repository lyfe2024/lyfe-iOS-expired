//
//  LoginCore.swift
//  LoginFeatureInterface
//
//  Created by 유상 on 10/28/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct LoginCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        let id: UUID = .init()
        
        init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
        case kakaoLogin
        case appleLogin
        case moveToClause
        case moveToInformation
    }
    
    func kakaoLogin() {
        print("카카오 로그인")
    }
    
    func appleLogin() {
        print("애플 로그인")
    }
    
    func moveToClause() {
        
    }
    
    func moveToInformation() {
        
    }
    
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .appleLogin:
                return .none
            case .kakaoLogin:
                return .none
            case .moveToClause:
                return .none
            case .moveToInformation:
                return .none
            }
        }
    }
}
