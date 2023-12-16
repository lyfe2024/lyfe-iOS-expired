//
//  ValidInfo.swift
//  DesignSystem
//
//  Created by 송형욱 on 12/15/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation

public struct ValidInfo: Hashable, Equatable {
    public var status: ViewStatus
    public var text: String
    
    public init(status: ViewStatus, text: String) {
        self.status = status
        self.text = text
    }
}
