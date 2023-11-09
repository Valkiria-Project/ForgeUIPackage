//
//  InventorySearchComponent.swift
//
//
//  Created by Diego Alejandro Villa Cardenas on 8/11/23.
//

import Foundation

public struct InventorySearchItem: Codable {
    public let name: RichLabelComponent
    public let assigned: Component.Content
    public let stock: Component.Content

    public init(name: RichLabelComponent, assigned: Component.Content, stock: Component.Content) {
        self.name = name
        self.assigned = assigned
        self.stock = stock
    }
}

public class InventorySearchComponent: Component {

    public let title: Component.Content
    public let icon: String
    public let inventoryItems: [InventorySearchItem]

    private enum CodingKeys: String, CodingKey {
        case title
        case icon
        case inventoryItems = "inventory_items"
    }

    public init(
        id: String,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        title: Component.Content,
        icon: String,
        inventoryItems: [InventorySearchItem]
    ) {
        self.title = title
        self.icon = icon
        self.inventoryItems = inventoryItems
        super.init(id: id, margins: margins, type: .inventorySearch, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.inventoryItems = try container.decode([InventorySearchItem].self, forKey: .inventoryItems)
        try super.init(from: decoder)
    }
}
