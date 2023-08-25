//
//  LabelComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class LabelComponent: Component {
    public private(set) var text: String
    public private(set) var color: String

    private enum CodingKeys: String, CodingKey {
        case text, color
    }

    public init(
        id: String,
        text: String,
        color: String,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.text = text
        self.color = color
        super.init(id: id, textStyle: textStyle, margins: margins, type: .label, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.color = try container.decode(String.self, forKey: .color)
        try super.init(from: decoder)
    }
}
