//
//  Validator.swift
//  CoreKit
//
//  Created by 송형욱 on 12/16/23.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation
import Dependencies

public struct Validator {
    public var isValidKorean: @Sendable (_ text: String) -> Bool
    public var isValidAlphabet: @Sendable (_ text: String) -> Bool
    public var isValidNumeric: @Sendable (_ text: String) -> Bool
    public var isValidSpecial: @Sendable (_ text: String) -> Bool
}

extension Validator: DependencyKey {
    public static var liveValue = Validator(
        isValidKorean: { text in
            let regExKorean = ".*[가-힣ㄱ-ㅎㅏ-ㅣ].*"
            let isValidKorean = text.range(of: regExKorean, options: .regularExpression) != nil
            
            return isValidKorean
        },
        isValidAlphabet: { text in
            let regExAlphabet = ".*[a-zA-Z].*"
            let isValidAlphabet = text.range(of: regExAlphabet, options: .regularExpression) != nil
            
            return isValidAlphabet
        },
        isValidNumeric: { text in
            let regExNumeric = ".*[0-9].*"
            let isValidNumeric = text.range(of: regExNumeric, options: .regularExpression) != nil
            
            return isValidNumeric
        },
        isValidSpecial: { text in
            let regExSpecial = ".*[+×÷=_/[/]!@#₩$^&()\\-:;,?`~\\\\|{}.․‘“].*"
            let isValidSpecial = text.range(of: regExSpecial, options: .regularExpression) != nil
            return isValidSpecial
        }
    )
}



extension DependencyValues {
    public var validator: Validator {
        get { self[Validator.self] }
        set { self[Validator.self] = newValue }
    }
}
