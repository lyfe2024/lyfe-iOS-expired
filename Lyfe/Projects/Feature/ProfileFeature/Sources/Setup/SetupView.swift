//
//  SetupView.swift
//  ProfileFeatureInterface
//
//  Created by 유상 on 12/27/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            HStack {
                Text("설정")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }.padding(.leading, 20)
            
            List {
                SetupListItem(title: "이용약관")
                SetupListItem(title: "개인정보처리방침")
            }.listStyle(.plain)
            
            
        }
    }
}
