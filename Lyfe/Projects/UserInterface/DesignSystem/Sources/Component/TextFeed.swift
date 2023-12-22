//
//  FeedTextGridItem.swift
//  DesignSystem
//
//  Created by 유상 on 12/22/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI

public struct TextFeed: View {
    public init() {
        
    }
    
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("몇 분전")
                .font(.system(size: 10))
                .foregroundColor(R.Color.grey300)
            
            Text("여기 텍스트 기반 피드 제목 들어옵니다. ")
                .font(.system(size: 16, weight: .bold))
            
            Text("여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지")
                .font(.system(size: 14))
                .lineLimit(2)
            
            HStack(spacing: 16) {
                HStack(spacing: 2) {
                    R.Common.iconWhiskey
                    
                    Text("40")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(R.Color.grey300)
                }
                
                HStack(spacing: 2) {
                    R.Common.iconComment
                    
                    Text("8")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(R.Color.grey300)
                }
                
                
            }
        }
    }
}

#Preview {
    TextFeed()
}
