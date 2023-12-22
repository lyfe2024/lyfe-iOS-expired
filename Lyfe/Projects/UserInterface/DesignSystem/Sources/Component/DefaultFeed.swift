//
//  FeedGridItem.swift
//  FeedFeatureInterface
//
//  Created by 유상 on 12/17/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI

public struct DefaultFeed: View {
    public init() {
        
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Rectangle()
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)
                    .cornerRadius(24)
                    
                    Text("유저이름")
                        .font(.system(size: 12, weight: .semibold))
                      .foregroundColor(.white)
                }
                Spacer()
                
                Text("사진 제목 텍스트 두줄까지 들어가고 넘어가는건")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .frame(width: 136, alignment: .topLeading)
            }
            .padding(10)
            .frame(width: 152, height: 210, alignment: .leading)
            .background(.black.opacity(0.3))
            .cornerRadius(16)
            
            HStack(spacing: 8) {
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

