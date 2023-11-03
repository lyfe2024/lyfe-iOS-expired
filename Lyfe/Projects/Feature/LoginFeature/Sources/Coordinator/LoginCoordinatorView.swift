//
//  LoginCoordinatorView.swift
//  LoginFeature
//
//  Created by 유상 on 11/4/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import BaseFeatureInterface
import TCACoordinators
import ComposableArchitecture

public struct LoginCoordinatorView: View {
    let store: StoreOf<LoginCoordinator>
    
    public init(store: StoreOf<LoginCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case.login:
                    CaseLet(
                        /LoginScreen.State.login,
                         action: LoginScreen.Action.login,
                         then: LoginView.init
                    )
                case.nickname:
                    CaseLet(
                        /LoginScreen.State.nickname,
                         action: LoginScreen.Action.nickname,
                         then: NicknameView.init
                    )
                }
            }
        }
    }
}
