//
//  FeedGridItem.swift
//  FeedFeatureInterface
//
//  Created by 유상 on 12/17/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import DesignSystem

struct FeedGridItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Rectangle()
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)
                    .cornerRadius(24)
                    
                    Text("유저이름")
                      .font(
                        Font.custom("Pretendard", size: 12)
                          .weight(.semibold)
                      )
                      .foregroundColor(.white)
                }
                Spacer()
                
                Text("사진 제목 텍스트\n두줄까지 들어가고 넘어가는건")
                  .font(
                    Font.custom("Pretendard", size: 14)
                      .weight(.bold)
                  )
                  .foregroundColor(.white)
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
                      .font(
                        Font.custom("Pretendard", size: 12)
                          .weight(.semibold)
                      )
                      .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                }
                
                HStack(spacing: 2) {
                    R.Common.iconComment
                    
                    Text("8")
                      .font(
                        Font.custom("Pretendard", size: 12)
                          .weight(.semibold)
                      )
                      .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                }
                
                
            }
        }
       
    }
}

#Preview {
    FeedGridItem()
}
