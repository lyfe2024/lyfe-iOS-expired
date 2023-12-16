//
//  NotificationView.swift
//  NotificationFeatureInterface
//
//  Created by 유상 on 12/16/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import DesignSystem

struct NotificationView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            HStack {
                Text("알림")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }.padding(.leading, 20)
            
            List {
                NotificationCell(title: "신청 사진 반응", time: "3시간 전", content: "신청하신 사진이 위스키 잔을 받았어요!")
                    .listRowSeparator(.hidden)
                NotificationCell(title: "신청 사진 반응", time: "3시간 전", content: "신청하신 사진에 댓글이 달렸어요.확인하러 가볼까요?")
                    .listRowSeparator(.hidden)
                NotificationCell(title: "신청 사진 반응", time: "3시간 전", content: "작성하신 글이 위스키 잔을 받았어요.")
                    .listRowSeparator(.hidden)
                NotificationCell(title: "신청 사진 반응", time: "3시간 전", content: "작성하신 글에 댓글이 달렸어요.확인하러 가볼까요?")
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    
                }, label: {
                    R.Common.arrowBack
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Text("모두 읽음")
                      .font(
                        Font.custom("Pretendard", size: 16)
                          .weight(.semibold)
                      )
                      .foregroundColor(R.Color.mainOrange500)
                })
            }
        }
    }
}

#Preview {
    NotificationView()
}
