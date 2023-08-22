//
//  ChipComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/07/23.
//

import Foundation

public class ChipComponent: Component {

    public let text: String
    public let icon: String?
    public let style: Style

    public enum Style: String, Codable {
        case primary = "PRIMARY"
        case secondary = "SECONDARY"
    }

    private enum CodingKeys: String, CodingKey {
        case text, icon, style
    }

    public init(
        id: String,
        text: String,
        icon: String?,
        style: Style,
        textStyle: Component.TextStyle,
        margins: Margin,
        arrangement: Component.Arrangement
    ) {
        self.text = text
        self.icon = icon
        self.style = style
        super.init(id: id, textStyle: textStyle, margins: margins, type: .chip, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
        self.style = try container.decode(Style.self, forKey: .style)
        try super.init(from: decoder)
    }
}

extension ChipComponent {
    static func example() throws -> ChipComponent {
        let component: ChipComponent = try fromJsonResource(named: "ChipComponent")
        return component
    }
}
