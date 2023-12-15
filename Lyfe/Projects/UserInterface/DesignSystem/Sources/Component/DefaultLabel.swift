//
//  DefaultLabel.swift
//  DesignSystem
//
//  Created by 송형욱 on 12/15/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import SwiftUI

public struct DefaultLabel: View {
    var status: ViewStatus
    var text: String
    
    public init(status: ViewStatus, text: String) {
        self.status = status
        self.text = text
    }
    
    private var defaultColor: Color {
        switch self.status {
        case .success: return R.Color.systemSuccess
        case .failure: return R.Color.systemError
        case .default: return R.Color.grey200
        }
    }
    
    private var icon: Image {
        switch self.status {
        case .success: return R.Common.checkMark
        case .failure: return R.Common.xMark
        case .default: return R.Common.checkMark
        }
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 6) {
            self.icon
                .resizable()
                .renderingMode(.template)
                .frame(width: 16, height: 16)
                .foregroundStyle(self.defaultColor)
            
            Text(self.text)
                .font(.system(size: 14, weight: .regular))
              .foregroundColor(self.defaultColor)
        }
        .frame(height: 24)
    }
}
