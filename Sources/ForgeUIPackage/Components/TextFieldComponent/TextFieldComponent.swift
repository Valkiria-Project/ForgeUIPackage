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

public class TextFieldComponent: Component {
    public private(set) var hint: String
    public private(set) var regex: String
    public private(set) var keyboardType: KeyboardType
    public private(set) var margins: Margin

    public init(hint: String, regex: String, keyboardType: KeyboardType, margins: Margin) {
        self.hint = hint
        self.regex = regex
        self.keyboardType = keyboardType
        self.margins = margins
        super.init()
    }

    private enum CodingKeys: String, CodingKey {
        case hint, regex, keyboardType, margins
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hint = try container.decode(String.self, forKey: .hint)
        self.regex = try container.decode(String.self, forKey: .regex)
        self.keyboardType = try container.decode(KeyboardType.self, forKey: .keyboardType)
        self.margins = try container.decode(Margin.self, forKey: .margins)
        super.init()
    }
}

extension TextFieldComponent {
    static func emailTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "EmailTextFieldComponent")
        return textFieldComponent
    }

    static func nameTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "NameTextFieldComponent")
        return textFieldComponent
    }

    static func numericTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "NumericTextFieldComponent")
        return textFieldComponent
    }

    static func phoneTextField() throws -> TextFieldComponent {
        let textFieldComponent: TextFieldComponent = try SerializationHelper.fromJsonResource(named: "PhoneTextFieldComponent")
        return textFieldComponent
    }
}
