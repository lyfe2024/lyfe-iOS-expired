//
//  LoginView.swift
//  LoginFeatureInterface
//
//  Created by 유상 on 10/27/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import DesignSystem
import LoginFeatureInterface

struct LoginView: View {
    let store: StoreOf<LoginCore>
    
    init(store: StoreOf<LoginCore>) {
        self.store = store
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Button(action: {
                self.store.send(.kakaoLogin)
            }, label: {
                Text("카카오톡 로그인")
            })
            
            Button(action: {
                self.store.send(.appleLogin)
            }, label: {
                Text("애플 로그인")
            })
            
            Text("소셜로그인으로 서비스를 시작할  경우,서비스 약관 및 개인정보 처리방침에 동의한 것으로 간주합니다. ")
        }
    }
}
