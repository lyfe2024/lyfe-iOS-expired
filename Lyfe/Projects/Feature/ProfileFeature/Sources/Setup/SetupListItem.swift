//
//  SetupListItem.swift
//  ProfileFeatureInterface
//
//  Created by 유상 on 12/28/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import SwiftUI
import DesignSystem

struct SetupListItem: View {
    @State var title: String
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(title)
                    .font(.system(size: 16))
                
                Spacer()
                
                R.Common.nextRight
                    .resizable()
            }.padding(.vertical, 12)
        }
       
    }
}


