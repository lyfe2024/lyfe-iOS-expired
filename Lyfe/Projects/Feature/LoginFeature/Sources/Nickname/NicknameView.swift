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
        VStack(alignment: .center, spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("닉네임 설정")
                            .font(.system(size: 24, weight: .bold))

                        Text("원하는 닉네임을 설정해주세요.")
                            .font(.system(size: 14, weight: .bold))
                    }
                    Spacer()
                }.padding(.leading, 20)

                HStack(spacing: 8) {
                    TextField("placeholder", text: .init(
                        get: { self.store.withState(\.name) },
                        set: { self.store.send(.binding(.set(\.$name, $0))) }
                    ))

                    Button {
                        self.store.send(.clear)
                    } label: {
                        DesignSystemAsset.CommonAssets.cancelMark.swiftUIImage
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
    //                .opacity(self.store.withState(\.isEnableThird) ? 1 : 0)
                }
                .padding(.leading, 12)
                .padding(.trailing, 8)
                .padding(.vertical, 8)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.21, green: 0.21, blue: 0.21), lineWidth: 1)
                )
            
            
        
        }.topBar(leftView: {
            Button {
                store.send(.dismiss)
            } label: {
                DesignSystemAsset.CommonAssets.arrowBack.swiftUIImage
            }
        })
    }
}
