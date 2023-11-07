//
//  ChipSelectionComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 13/09/23.
//

import Foundation

public class ChipSelectionComponent: Component {
    public let selectionVisibility: [String: String]?

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
        case title, items, selected
        case selectionVisibility = "selection_visibility"
    }

    // MARK: - Properties
    public var title: Component.Content
    public var items: [Item]
    public var selected: String?

    // MARK: - Constructor
    public init(
        id: String,
        margins: Margin,
        arrangement: Arrangement,
        title: Component.Content,
        items: [Item],
        selected: String? = nil,
        selectionVisibility: [String: String]? = nil

    ) {
        self.title = title
        self.items = items
        self.selected = selected
        self.selectionVisibility = selectionVisibility
        super.init(id: id, margins: margins, type: .chipOptions, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.items = try container.decode([Item].self, forKey: .items)
        self.selected = try container.decodeIfPresent(String.self, forKey: .selected)
        self.selectionVisibility = try container.decodeIfPresent([String: String].self, forKey: .selectionVisibility)
        try super.init(from: decoder)
    }
}
