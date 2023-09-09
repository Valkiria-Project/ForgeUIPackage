//
//  File.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/09/23.
//

import Foundation

public class InventoryCheckComponent: Component {

    public struct InventoryItem: Codable {
        public let name: RichLabelComponent
        public let registeredValue: Component.Content
        public let receivedValue: Component.Content

        private enum CodingKeys: String, CodingKey {
            case name
            case registeredValue = "registered_value"
            case receivedValue = "received_value"
        }

        public init(name: RichLabelComponent, registeredValue: Component.Content, receivedValue: Component.Content) {
            self.name = name
            self.registeredValue = registeredValue
            self.receivedValue = receivedValue
        }
    }

    public let registered: Component.Content
    public let received: Component.Content
    public let items: [InventoryItem]

    private enum CodingKeys: String, CodingKey {
        case registered, received, items
    }

    public init(
        id: String,
        registered: Component.Content,
        received: Component.Content,
        items: [InventoryItem],
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.registered = registered
        self.received = received
        self.items = items
        super.init(id: id, margins: margins, type: .inventoryCheck, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.registered = try container.decode(Component.Content.self, forKey: .registered)
        self.received = try container.decode(Component.Content.self, forKey: .received)
        self.items = try container.decode([InventoryItem].self, forKey: .items)
        try super.init(from: decoder)
    }
}
