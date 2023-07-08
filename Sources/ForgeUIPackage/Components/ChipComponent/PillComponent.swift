//
//  ChipComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/07/23.
//

import Foundation

public class ChipComponent: Component {

    public let text: String
    public let icon: String

    private enum CodingKeys: String, CodingKey {
        case text, icon
    }

    public init(
        identifier: Component.Identifier? = nil,
        text: String,
        icon: String,
        margins: Margin
    ) {
        self.text = text
        self.icon = icon
        super.init(identifier: identifier, margins: margins)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.icon = try container.decode(String.self, forKey: .icon)
        try super.init(from: decoder)
    }
}

extension ChipComponent {
    static func example() throws -> ChipComponent {
        let component: ChipComponent = try fromJsonResource(named: "ChipComponent")
        return component
    }
}
