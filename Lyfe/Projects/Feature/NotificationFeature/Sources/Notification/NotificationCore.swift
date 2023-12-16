//
//  NotificationCore.swift
//  NotificationFeatureInterface
//
//  Created by 유상 on 12/16/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct NotificationCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        let id: UUID = .init()
        
        init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
        case allRead
        case moveToPost
    }
    
    func allRead() {
        print("모두 읽음")
    }
    
    func moveToPost() {
        print("게시글로 이동")
    }

    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .allRead:
                return .none
            case .moveToPost:
                return .none
            }
        }
    }
}
