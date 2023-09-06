//
//  ChipOptionComponent.swift
//  
//
//  Created by Ricardo Grajales Duque on 22/08/23.
//

import Foundation

public class ChipOptionComponent: Component {

    // MARK: - ChipOptionComponent Internal Models
    public struct Item: Codable, Hashable {
        public var id: String
        public var name: String

        public init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }

    public struct Text: Codable {
        public var text: String
        public var style: Component.TextStyle

        private enum CodingKeys: String, CodingKey {
            case text
            case style = "text_style"
        }

        public init(text: String, style: Component.TextStyle) {
            self.text = text
            self.style = style
        }
    }

    private enum CodingKeys: String, CodingKey {
        case title, items
    }

    // MARK: - Properties
    public var title: Text
    public var items: [Item]

    // MARK: - Constructor
    public init(id: String, margins: Margin, arrangement: Arrangement, title: ChipOptionComponent.Text, items: [Item]) {
        self.title = title
        self.items = items
        super.init(id: id, margins: margins, type: .chipOptions, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(ChipOptionComponent.Text.self, forKey: .title)
        self.items =  try container.decode([Item].self, forKey: .items)
        try super.init(from: decoder)
    }
}
