//
//  FeedHomeView.swift
//  FeedFeatureInterface
//
//  Created by 유상 on 12/17/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import DesignSystem
import ComposableArchitecture


enum FeedTap: String, CaseIterable {
    case new = "최신"
    case popular = "인기"
}

struct FeedHomeView: View {
    let store: StoreOf<FeedHomeCore>
    
    init(store: StoreOf<FeedHomeCore>) {
        self.store = store
    }
    
    
    var body: some View {
        VStack(spacing: 10) {
            HStack() {
                Text("피드")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    store.send(.photoRequest)
                } label: {
                    // Button/B1
                    Text("사진 신청")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(R.Color.mainOrange500)
                }

            }
            FeedTabView(store: self.store)
                
        }
        .padding(.horizontal, 20)
    }
}

struct detailView: View {
    
    let store: StoreOf<FeedHomeCore>
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var feedTabs: FeedTap
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch feedTabs {
            case .new:
                LazyVGrid(columns: columns, spacing: 12) {
                        ForEach((0...19), id: \.self) { _ in
                            DefaultFeed()
                                .onTapGesture {
                                    store.send(.moveToDetail)
                                }
                        }
                    }

            case .popular:
                LazyVGrid(columns: columns,spacing: 12) {
                        ForEach((0...19), id: \.self) { _ in
                            DefaultFeed()
                                .onTapGesture {
                                    store.send(.moveToDetail)
                                }
                        }
                }
            }
        }
    }
}



struct FeedTabView: View {
    let store: StoreOf<FeedHomeCore>
    
    @State private var selectedPicker: FeedTap = .new
    @Namespace private var animation
    
    var body: some View {
        VStack {
            animate()
            detailView(store: self.store, feedTabs: selectedPicker)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(FeedTap.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .frame(maxWidth: .infinity/4, minHeight: 32)
                        .font(
                            Font.custom("Pretendard", size: 18)
                            .weight(.bold)
                        )
                        .foregroundColor(selectedPicker == item ? R.Color.mainOrange500: R.Color.grey200)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(R.Color.mainOrange500)
                            .frame(height: 2)
                            .font(.title3)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

