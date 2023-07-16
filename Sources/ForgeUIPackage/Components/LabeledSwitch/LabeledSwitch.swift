//
//  LabeledSwitch.swift
//  
//
//  Created by Ricardo Grajales Duque on 15/07/23.
//

import Foundation

public class LabeledSwitch: Component {
    public let text: String
    public let toggle: Bool

    private enum CodingKeys: String, CodingKey {
        case text, toggle
    }

    public init(
        identifier: Component.Identifier? = nil,
        text: String,
        toggle: Bool,
        textStyle: Component.TextStyle,
        margins: Margin
    ) {
        self.text = text
        self.toggle = toggle
        super.init(identifier: identifier, textStyle: textStyle, margins: margins, type: .chip)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.toggle = try container.decode(Bool.self, forKey: .toggle)
        try super.init(from: decoder)
    }
}
