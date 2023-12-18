//
//  FeedHomeCore.swift
//  FeedFeatureInterface
//
//  Created by 유상 on 12/18/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct FeedHomeCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        let id: UUID = .init()
        
        init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
        case photoRequest
        case moveToDetail
        case moveToLogin
    }
    
    func photoRequest() {
        print("사진 신청")
    }
    
    func moveToDetail() {
        print("게시글로 이동")
    }

    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .photoRequest:
                return .none
            case .moveToDetail:
                return .none
            case .moveToLogin:
                return .none
            }
        }
    }
}

