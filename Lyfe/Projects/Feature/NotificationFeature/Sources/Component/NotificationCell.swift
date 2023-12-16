//
//  NotificationCell.swift
//  NotificationFeatureInterface
//
//  Created by 유상 on 12/16/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import DesignSystem

struct NotificationCell: View {
    @State var title: String?
    @State var time: String?
    @State var content: String?
    
    var body: some View {
        VStack() {
            HStack(spacing: 8) {
                R.Common.iconNotification
                    .frame(width: 24, height: 24)
                    
                
                Text(title!)
                  .font(Font.custom("Pretendard", size: 12))
                  .foregroundColor(R.Color.grey300)
                
                Spacer()
                
                Text(time!)
                  .font(Font.custom("Pretendard", size: 12))
                  .multilineTextAlignment(.trailing)
                  .foregroundColor(R.Color.grey300)
            }
            
            // Body/Body2
            Text(content!)
              .font(
                Font.custom("Pretendard", size: 16)
                  .weight(.medium)
              )
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
    }
}

