//
//  UIScreen+.swift
//  DesignSystem
//
//  Created by 유상 on 11/5/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    func screenWidth() -> CGFloat {
        return UIScreen().bounds.width
    }
    
    func screenHeight() -> CGFloat {
        return UIScreen().bounds.height
    }
}
