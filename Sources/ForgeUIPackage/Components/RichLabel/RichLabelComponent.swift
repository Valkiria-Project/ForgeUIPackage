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
        text: String,
        textStyle: Component.TextStyle,
        margins: Component.Margin
    ) {
        self.text = text
        super.init(textStyle: textStyle, margins: margins, type: .richLabel)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        try super.init(from: decoder)
    }
}
