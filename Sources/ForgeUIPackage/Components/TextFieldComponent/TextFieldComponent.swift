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

//public enum TextFieldStyle: String, Codable {
//    case primary = "PRIMARY"
//    case link = "LINK"
//    case fingerprint = "FINGERPRINT"
//}

public class TextFieldComponent: Component {
    public private(set) var hint: String
    public private(set) var validations: [RegexValidation]
    public private(set) var keyboardType: KeyboardType
    public private(set) var icon: String?

    public init(
        identifier: Component.Identifier? = nil,
        hint: String,
        icon: String? = nil,
        validations: [RegexValidation],
        keyboardType: KeyboardType,
        margins: Margin
    ) {
        self.hint = hint
        self.icon = icon
        self.validations = validations
        self.keyboardType = keyboardType
        super.init(identifier: identifier, margins: margins, type: .textField)
    }

    private enum CodingKeys: String, CodingKey {
        case hint, validations, keyboardType, icon
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hint = try container.decode(String.self, forKey: .hint)
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
