//
//  FeedHomeView.swift
//  FeedFeatureInterface
//
//  Created by 유상 on 12/17/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import DesignSystem

enum FeedTap: String, CaseIterable {
    case new = "최신"
    case popular = "인기"
}

struct FeedHomeView: View {
    var body: some View {
        VStack {
            FeedTabView()
        }.padding(.horizontal, 20)
    }
}

struct detailView: View {
    var feedTabs: FeedTap
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch feedTabs {
            case .new:
                Text("최신")
            case .popular:
                Text("인기")
            }
        }
    }
}



struct FeedTabView: View {
    
    @State private var selectedPicker: FeedTap = .new
    @Namespace private var animation
    
    var body: some View {
        VStack {
            animate()
            detailView(feedTabs: selectedPicker)
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

#Preview {
    FeedHomeView()
}
