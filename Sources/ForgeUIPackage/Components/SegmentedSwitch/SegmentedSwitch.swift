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
    public let readOnly: Bool
    public let selected: Bool

    private enum CodingKeys: String, CodingKey {
        case text, options, selected
        case readOnly = "read_only"
    }

    public init(
        id: String,
        text: String,
        options: [SegmentedSwitch.Option],
        readOnly: Bool,
        selected: Bool,
        textStyle: Component.TextStyle,
        margins: Margin,
        arrangement: Component.Arrangement
    ) {
        self.text = text
        self.options = options
        self.selected = selected
        self.readOnly = readOnly
        super.init(id: id, textStyle: textStyle, margins: margins, type: .chip, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.options = try container.decode([Option].self, forKey: .options)
        self.readOnly = try container.decode(Bool.self, forKey: .readOnly)
        self.selected = try container.decode(Bool.self, forKey: .selected)
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
