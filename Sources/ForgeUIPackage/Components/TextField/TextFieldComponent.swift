//
//  TextFieldComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public enum KeyboardType: String, Codable {
    case numeric = "NUMERIC"
    case phone = "PHONE"
    case text = "TEXT"
    case email = "EMAIL"
    case password = "PASSWORD"
}

public class TextFieldComponent: Component {
    public private(set) var placeholder: String
    public private(set) var validations: [RegexValidation]
    public private(set) var keyboardType: KeyboardType
    public private(set) var icon: String?

    public init(
        identifier: Component.Identifier? = nil,
        placeholder: String,
        icon: String? = nil,
        validations: [RegexValidation],
        keyboardType: KeyboardType,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.placeholder = placeholder
        self.icon = icon
        self.validations = validations
        self.keyboardType = keyboardType
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
        self.keyboardType = try container.decode(KeyboardType.self, forKey: .keyboardType)
        try super.init(from: decoder)
    }
}

extension TextFieldComponent {
    static func emailTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try fromJsonResource(named: "EmailTextFieldComponent")
        return textFieldComponent
    }

    static func nameTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try fromJsonResource(named: "NameTextFieldComponent")
        return textFieldComponent
    }

    static func numericTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try fromJsonResource(named: "NumericTextFieldComponent")
        return textFieldComponent
    }

    static func phoneTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try fromJsonResource(named: "PhoneTextFieldComponent")
        return textFieldComponent
    }
}
