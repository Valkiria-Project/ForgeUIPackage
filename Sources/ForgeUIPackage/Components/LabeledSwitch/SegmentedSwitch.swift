//
//  SegmentedSwitch.swift
//  
//
//  Created by Ricardo Grajales Duque on 15/07/23.
//

import Foundation

public class SegmentedSwitch: Component {
    public let text: String
    public let options: [Option]

    private enum CodingKeys: String, CodingKey {
        case text, options
    }

    public init(
        identifier: Component.Identifier? = nil,
        text: String,
        options: [SegmentedSwitch.Option],
        textStyle: Component.TextStyle,
        margins: Margin
    ) {
        self.text = text
        self.options = options
        super.init(identifier: identifier, textStyle: textStyle, margins: margins, type: .chip)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
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
