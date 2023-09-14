//
//  ChipSelectionComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 13/09/23.
//

import Foundation

public class ChipSelectionComponent: Component {

    // MARK: - ChipOptionComponent Internal Models
    public struct Item: Codable, Hashable {
        public var id: String
        public var name: String

        public init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }

    private enum CodingKeys: String, CodingKey {
        case title, items
    }

    // MARK: - Properties
    public var title: Component.Content
    public var items: [Item]

    // MARK: - Constructor
    public init(id: String, margins: Margin, arrangement: Arrangement, title: Component.Content, items: [Item]) {
        self.title = title
        self.items = items
        super.init(id: id, margins: margins, type: .chipOptions, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.items =  try container.decode([Item].self, forKey: .items)
        try super.init(from: decoder)
    }
}
