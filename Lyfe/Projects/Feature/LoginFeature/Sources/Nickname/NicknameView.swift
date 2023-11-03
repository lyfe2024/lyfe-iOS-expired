//
//  NicknameView.swift
//  LoginFeature
//
//  Created by 유상 on 11/4/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import DesignSystem

struct NicknameView: View {
    let store: StoreOf<NicknameCore>
    
    init(store: StoreOf<NicknameCore>) {
        self.store = store
    }
    
    var body: some View {
        VStack {
            
        }.topBar(leftView: {
            Button {
                store.send(.dismiss)
            } label: {
                DesignSystemAsset.CommonAssets.arrowBack.swiftUIImage
            }
            
        })
    }
}
