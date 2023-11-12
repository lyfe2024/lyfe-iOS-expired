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
        public let id: UUID = .init()
        
        public init() {}
        
        @BindingState public var name: String = ""
        public var isInput: Bool = false
        public var isEnableFirst: Bool = false
        public var isEnableSecond: Bool = false
        public var isEnableThird: Bool = false
        public var isEnableDoneButton: Bool = false
    }
    
    public enum Action: BindableAction, Equatable {
        case onAppear
        case dismiss
        case binding(BindingAction<State>)
        case clear
    }
    
    func hasCharacters(name: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ\\s]$", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: name, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, name.count)) {
                return true
            }
        }catch {
            return false
        }
        return false
    }
    
    
    public var body: some Reducer<State, Action> {
        BindingReducer()
            
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case .dismiss:
                return .none
            case .binding(\.$name):
                state.isInput = state.name.count > 0
                state.isEnableFirst = hasCharacters(name: state.name)
                state.isEnableSecond = hasCharacters(name: state.name)
                if (state.name.count > 0 && state.name.count < 11) {
                    state.isEnableThird = true
                }
                state.isEnableDoneButton = state.isEnableFirst && state.isEnableSecond && state.isEnableThird
                return .none
            case .binding:
                return .none
            case .clear:
                state.name = ""
//                state.isEnableFirst = false
//                state.isEnableSecond = false
//                state.isEnableThird = false
//                state.isEnableDoneButton = false
                return .none
            }
        }
    }
    
    
}

