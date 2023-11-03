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

public struct LoginCoordinator: Reducer {
    public init() {}
    
    public struct State: Equatable, IdentifiedRouterState {
        public let id: UUID = .init()
        public var routes: IdentifiedArrayOf<Route<LoginScreen.State>>
        
        public init() {
            self.routes = [
                .root(.login(.init()), embedInNavigationView: true)
            ]
        }
    }
    
    public indirect enum Action: Equatable, IdentifiedRouterAction {
        case routeAction(_ id: LoginScreen.State.ID, action: LoginScreen.Action)
        case updateRoutes(IdentifiedArrayOf<Route<LoginScreen.State>>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case.routeAction(_, action: .login(.kakaoLogin)), .routeAction(_, action: .login(.appleLogin)):
                let nicknameState = NicknameCore.State.init()
                state.routes.push(.nickname(nicknameState))
            case.routeAction(_, action: .nickname(.dismiss)):
                state.routes.goBack()
            default:
                break
            }
            return .none
        }
    }
}

