//
//  LabeledSwitch.swift
//  
//
//  Created by Ricardo Grajales Duque on 15/07/23.
//

import Foundation

public class SegmentedSwitch: Component {
    public let text: String
    public let toggle: Bool
    public let options: [Option]

    private enum CodingKeys: String, CodingKey {
        case text, toggle, options
    }

    public init(
        identifier: Component.Identifier? = nil,
        text: String,
        toggle: Bool,
        options: [SegmentedSwitch.Option],
        textStyle: Component.TextStyle,
        margins: Margin
    ) {
        self.text = text
        self.toggle = toggle
        self.options = options
        super.init(identifier: identifier, textStyle: textStyle, margins: margins, type: .chip)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.toggle = try container.decode(Bool.self, forKey: .toggle)
        self.options = try container.decode([Option].self, forKey: .options)
        try super.init(from: decoder)
    }

    public struct Option: Codable, Hashable {
        public let text: String
        public let style: Component.TextStyle
        public let color: String

        private enum CodingKeys: String, CodingKey {
            case text, color
            case style = "text_style"
        }

        public init(text: String, style: Component.TextStyle, color: String) {
            self.text = text
            self.style = style
            self.color = color
        }
    }
}
