//
//  TextValidator.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 6/07/23.
//

import Foundation

class TextValidator {
    private let validations: [RegexValidation]

    init(_ validations: [RegexValidation]) {
        self.validations = validations
    }

    func validate(text: String) -> String? {
        let validation = validations.first {
            text.range(of: $0.regex, options: .regularExpression) != nil
        }

        return validation?.message
    }
}
