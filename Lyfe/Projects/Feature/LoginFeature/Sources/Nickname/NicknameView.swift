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
                }

                ZStack {
                    TextField("placeholder", text: .init(
                        get: { self.store.withState(\.name) },
                        set: { self.store.send(.binding(.set(\.$name, $0))) }
                    ))
                    .frame( height: 48)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.21, green: 0.21, blue: 0.21), lineWidth: 1)
                    )
                    
                    HStack() {
                        Spacer()
                        
                        Button {
                            self.store.send(.clear)
                        } label: {
                            DesignSystemAsset.CommonAssets.cancelMark.swiftUIImage
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .padding(.trailing, 28)
    //                    .opacity(self.store.withState(\.isEnableThird) ? 1 : 0)
                    }
                }
                .padding(.top, 72)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    DesignSystemAsset.CommonAssets.checkMark.swiftUIImage
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(store.withState(\.isEnableFirst) ? DesignSystemAsset.Color.blue001.swiftUIColor : DesignSystemAsset.Color.gray002.swiftUIColor)
                    
                    Text("영문/한글 + 숫자조합")
                        .font(Font.system(size: 14))
                        .foregroundColor(store.withState(\.isEnableFirst) ? DesignSystemAsset.Color.blue001.swiftUIColor : DesignSystemAsset.Color.gray002.swiftUIColor)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    DesignSystemAsset.CommonAssets.checkMark.swiftUIImage
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(store.withState(\.isEnableSecond) ? DesignSystemAsset.Color.blue001.swiftUIColor : DesignSystemAsset.Color.gray002.swiftUIColor)
                    
                    Text("특수문자 사용 X")
                        .font(Font.system(size: 14))
                        .foregroundColor(store.withState(\.isEnableSecond) ? DesignSystemAsset.Color.blue001.swiftUIColor : DesignSystemAsset.Color.gray002.swiftUIColor)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    DesignSystemAsset.CommonAssets.checkMark.swiftUIImage
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(store.withState(\.isEnableThird) ? DesignSystemAsset.Color.blue001.swiftUIColor : DesignSystemAsset.Color.gray002.swiftUIColor)
                    
                    Text("최대 10글자")
                        .font(Font.system(size: 14))
                        .foregroundColor(store.withState(\.isEnableThird) ? DesignSystemAsset.Color.blue001.swiftUIColor : DesignSystemAsset.Color.gray002.swiftUIColor)
                    
                    Spacer()
                }
            }.padding(.top, 9)
            
            Spacer()
            
            Button {
                            
            } label: {
                Text("다음")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(
                        self.store.withState(\.isEnableDoneButton)
                        ? Color.white
                        : DesignSystemAsset.Color.gray003.swiftUIColor
                    )
                    .frame(height: 24)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .background(
                self.store.withState(\.isEnableDoneButton)
                ? Color.black
                : DesignSystemAsset.Color.gray001.swiftUIColor
            )
            .cornerRadius(10)
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 20)
        .topBar(leftView: {
            Button {
                store.send(.dismiss)
            } label: {
                DesignSystemAsset.CommonAssets.arrowBack.swiftUIImage
            }
        })
    }
}
