//
//  PasswordTextFieldComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 11/07/23.
//

import Foundation

public class PasswordTextFieldComponent: Component {
    public private(set) var placeholder: String
    public private(set) var validations: [RegexValidation]
    public private(set) var icon: String?

    public init(
        identifier: Component.Identifier? = nil,
        placeholder: String,
        icon: String? = nil,
        validations: [RegexValidation],
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.placeholder = placeholder
        self.icon = icon
        self.validations = validations
        super.init(identifier: identifier, textStyle: textStyle, margins: margins, type: .textField, arrangement: arrangement)
    }

    private enum CodingKeys: String, CodingKey {
        case placeholder, validations, icon
        case keyboardType = "keyboard_type"
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placeholder = try container.decode(String.self, forKey: .placeholder)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.validations = try container.decode([RegexValidation].self, forKey: .validations)
        try super.init(from: decoder)
    }
}

extension PasswordTextFieldComponent {
    static func example() throws -> PasswordTextFieldComponent {
        let textFieldComponent: PasswordTextFieldComponent = try fromJsonResource(named: "PasswordTextFieldComponent")
        return textFieldComponent
    }
}
