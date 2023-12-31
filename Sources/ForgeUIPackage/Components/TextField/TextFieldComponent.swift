//
//  TextFieldComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 27/06/23.
//

import Foundation

public class TextFieldComponent: Component {

    public enum KeyboardType: String, Codable {
        case numeric = "NUMERIC"
        case phone = "PHONE"
        case text = "TEXT"
        case email = "EMAIL"
        case password = "PASSWORD"
    }

    public enum Style: String, Codable {
        case filled = "FILLED"
        case outlined = "OUTLINED"
        case datePicker = "DATE_PICKER"
        case fixedDate =  "FIXED_DATE"
    }

    public let placeholder: String
    public let validations: [RegexValidation]
    public let keyboardType: KeyboardType
    public let style: Style
    public let icon: String?
    public let charLimit: Int?
    public let realTimeValidation: Bool
    public let maxDate: String?
    public let minDate: String?

    public init(
        id: String,
        placeholder: String,
        icon: String? = nil,
        charLimit: Int? = nil,
        realTimeValidation: Bool = false,
        minDate: String? = nil,
        maxDate: String? = nil,
        validations: [RegexValidation],
        keyboardType: KeyboardType,
        textStyle: Component.TextStyle,
        style: Style,
        margins: Component.Margin,
        arrangement: Component.Arrangement
        
    ) {
        self.placeholder = placeholder
        self.icon = icon
        self.charLimit = charLimit
        self.validations = validations
        self.realTimeValidation = realTimeValidation
        self.minDate = minDate
        self.maxDate = maxDate
        self.style = style
        self.keyboardType = keyboardType
        super.init(id: id, textStyle: textStyle, margins: margins, type: .textField, arrangement: arrangement)
    }

    private enum CodingKeys: String, CodingKey {
        case placeholder, validations, icon, style
        case keyboardType = "keyboard_type"
        case charLimit = "char_limit"
        case realTimeValidation = "real_time_validation"
        case maxDate = "max_date"
        case minDate = "min_date"
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.placeholder = try container.decode(String.self, forKey: .placeholder)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.charLimit = try container.decodeIfPresent(Int.self, forKey: .charLimit)
        self.style = try container.decode(Style.self, forKey: .style)
        self.validations = try container.decode([RegexValidation].self, forKey: .validations)
        self.realTimeValidation = try container.decode(Bool.self, forKey: .realTimeValidation)
        self.keyboardType = try container.decode(KeyboardType.self, forKey: .keyboardType)
        self.minDate = try container.decodeIfPresent(String.self, forKey: .minDate)
        self.maxDate = try container.decodeIfPresent(String.self, forKey: .maxDate)
        try super.init(from: decoder)
    }
}
