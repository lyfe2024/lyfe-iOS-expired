//
//  NicknameCore.swift
//  LoginFeature
//
//  Created by 유상 on 11/4/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct NicknameCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        let id: UUID = .init()
        
        init() {}
        
        @BindingState var nickname: String = ""
        var isEnableFirst: Bool = false
        var isEnableSecond: Bool = false
        var isEnableThird: Bool = false
        var isEnableDoneButton: Bool = false
    }
    
    public enum Action: Equatable, BindableAction {
        case onAppear
        case dismiss
        case binding(BindingAction<State>)
    }
    
    func hasCharacters(nickname: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ\\s]$", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: nickname, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, nickname.count)) {
                return true
            }
        }catch {
            return false
        }
        return false
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .dismiss:
                return .none
            case .binding(\.$nickname):
                state.isEnableFirst = hasCharacters(nickname: state.nickname)
                state.isEnableSecond = hasCharacters(nickname: state.nickname)
                state.isEnableThird = state.nickname.count > 0 && state.nickname.count < 11
                state.isEnableDoneButton = state.isEnableFirst && state.isEnableSecond && state.isEnableThird
                return .none
            case .binding:
                return .none
            }
        }
    }
    
    
}

