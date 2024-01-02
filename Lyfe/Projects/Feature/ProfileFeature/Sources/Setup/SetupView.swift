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
    
    var body: some View {
        VStack(spacing: 16.0) {
            HStack {
                Text("설정")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }.padding(.leading, 20)
            
            List {
                SetupListItem(title: "이용약관")
                    .listRowSeparator(.hidden)
                SetupListItem(title: "개인정보처리방침")
                    .listRowSeparator(.hidden)
            }.listStyle(.plain)
            
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
