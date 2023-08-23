//
//  RichLabelComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 10/07/23.
//

import Foundation

public class RichLabelComponent: Component {
    public private(set) var text: String

    private enum CodingKeys: String, CodingKey {
        case text, style
    }

    public init(
        id: String,
        text: String,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.text = text
        super.init(id: id, textStyle: textStyle, margins: margins, type: .richLabel, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        try super.init(from: decoder)
    }
}
