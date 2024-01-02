//
//  SetupView.swift
//  ProfileFeatureInterface
//
//  Created by 유상 on 12/27/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import DesignSystem

struct SetupView: View {
    let store: StoreOf<SetupCore>
    
    init(store: StoreOf<SetupCore>) {
        self.store = store
    }
    
    // MARK: Domain 연결 후 Core로 옮기기 - 임시 데이터
    @State var isNotification: Bool = true
    
    var body: some View {
        VStack(spacing: 16.0) {
            HStack {
                Text("설정")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }.padding(.leading, 20)
            
            List {
                VStack(alignment: .center) {
                    HStack {
                        Toggle(isOn: $isNotification) {
                            Text("알림 설정")
                                .font(.system(size: 16))
                        }
                        .tint(R.Color.mainOrange500)
                    }.padding(.vertical, 12)
                }.listRowSeparator(.hidden)
                SetupListItem(title: "스크랩")
                    .listRowSeparator(.hidden)
                SetupListItem(title: "사용경험")
                    .listRowSeparator(.hidden)
                SetupListItem(title: "개인정보 수집 및 이용 동의")
                    .listRowSeparator(.hidden)
                SetupListItem(title: "회원탈퇴")
                    .listRowSeparator(.hidden)
            }.listStyle(.plain)
            
            Spacer()
            
            
            DefaultButton(
                text: "로그아웃",
                isEnabled: true,
                tapAction: { }
            )
            .padding(.bottom, 24)
            .padding(.horizontal, 20)
            
        }.topBar(
            leftView: {
                Button {
                    self.store.send(.dismiss)
                } label: {
                    R.Common.arrowBack
                }
            }
        )
        .background(Color.white)
        .task {
            self.store.send(.onAppear)
        }
    }
}
