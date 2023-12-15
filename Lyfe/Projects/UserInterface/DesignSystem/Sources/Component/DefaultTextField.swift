//
//  DefaultTextField.swift
//  DesignSystem
//
//  Created by 송형욱 on 12/14/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import SwiftUI

public struct DefaultTextField: View {
    @Binding var text: String
    var placeholder: String
    @FocusState var focusState: FocusField?
    
    public init(
        text: Binding<String>,
        placeholder: String,
        focusState: FocusState<FocusField?>
    ) {
        self._text = text
        self.placeholder = placeholder
        self._focusState = focusState
    }
    
    private var borderColor: Color {
        switch self.focusState {
        case .on: return R.Color.grey900
        case .off: return R.Color.grey200
        case .error: return R.Color.systemError
        case nil: return R.Color.grey200
        }
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            TextField(self.placeholder, text: self.$text)
                .focused(self.$focusState, equals: .on)
            
            Button {
                self.text = ""
            } label: {
                R.Common.cancelMark
                    .resizable()
                    .frame(width: 32, height: 32)
            }
        }
        .padding(.leading, 12)
        .padding(.trailing, 8)
        .padding(.vertical, 8)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(self.borderColor, lineWidth: 1)
        )
    }
}
