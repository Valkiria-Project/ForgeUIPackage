//
//  SimpleCardComponent.swift
//
//
//  Created by Diego Alejandro Villa Cardenas on 8/11/23.
//

import Foundation

public class SimpleCardComponent: Component {
    public let icon: String
    public let title: Component.Content

    private enum CodingKeys: String, CodingKey {
        case icon, title
    }

    public init(
        id: String,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        icon: String,
        title: Component.Content
    ) {
        self.icon = icon
        self.title = title
        super.init(id: id, margins: margins, type: .simpleCard, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        try super.init(from: decoder)
    }
}
