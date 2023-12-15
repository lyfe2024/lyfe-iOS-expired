//
//  ValidationView.swift
//  DesignSystem
//
//  Created by 송형욱 on 12/15/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import SwiftUI


public struct ValidationView: View {
    
    var list: [ValidInfo]
    
    public init(list: [ValidInfo]) {
        self.list = list
    }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.list, id: \.self) { info in
                    DefaultLabel(status: info.status, text: info.text)
                }
            }
            
            Spacer()
        }
    }
}
