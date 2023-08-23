//
//  HeaderComponent.swift
//  
//
//  Created by Ricardo Grajales Duque on 20/08/23.
//

import Foundation

public class HeaderComponent: Component {
    public private(set) var text: String
    public private(set) var leftIcon: String?

    private enum CodingKeys: String, CodingKey {
        case text
        case leftIcon = "left_icon"
    }

    public init(
        text: String,
        leftIcon: String?,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.text = text
        self.leftIcon = leftIcon
        super.init(margins: margins, type: .contentHeader, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.leftIcon = try container.decodeIfPresent(String.self, forKey: .leftIcon)
        try super.init(from: decoder)
    }
}
