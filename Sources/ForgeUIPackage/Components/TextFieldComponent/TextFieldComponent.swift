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
}

//public enum TextFieldStyle: String, Codable {
//    case primary = "PRIMARY"
//    case link = "LINK"
//    case fingerprint = "FINGERPRINT"
//}

public struct TextFieldComponent: Component, Codable, Identifiable {
    public let id: UUID
    let hint: String
    let regex: String
    let keyboardType: KeyboardType
    let margin: Margin

    public init(hint: String, regex: String, keyboardType: KeyboardType, margin: Margin) {
        self.id = UUID()
        self.hint = hint
        self.regex = regex
        self.keyboardType = keyboardType
        self.margin = margin
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.hint = try container.decode(String.self, forKey: .hint)
        self.regex = try container.decode(String.self, forKey: .regex)
        self.keyboardType = try container.decode(KeyboardType.self, forKey: .keyboardType)
        self.margin = try container.decode(Margin.self, forKey: .margin)
    }
}

extension TextFieldComponent {
    static func emailTextField() throws -> Self {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "EmailTextFieldComponent")
        return textFieldComponent
    }

    static func nameTextField() throws -> Self {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "NameTextFieldComponent")
        return textFieldComponent
    }

    static func numericTextField() throws -> Self {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "NumericTextFieldComponent")
        return textFieldComponent
    }

    static func phoneTextField() throws -> Self {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "PhoneTextFieldComponent")
        return textFieldComponent
    }
}
