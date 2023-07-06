//
//  TextValidator.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 6/07/23.
//

import Foundation

class TextValidator {
    private let regex: String

    init(regex: String) {
        self.regex = regex
    }

    func validate(text: String) -> Bool {
        let result = text.range(of: self.regex, options: .regularExpression)
        return result != nil
    }
}
