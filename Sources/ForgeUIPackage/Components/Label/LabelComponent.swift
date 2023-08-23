//
//  LabelComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class LabelComponent: Component {
    public private(set) var text: String

    private enum CodingKeys: String, CodingKey {
        case text
    }

    public init(
        id: String,
        text: String,
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.text = text
        super.init(id: id, textStyle: textStyle, margins: margins, type: .label, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        try super.init(from: decoder)
    }
}

extension LabelComponent {
    static func titleExample() throws -> LabelComponent {
        let labelComponent: LabelComponent = try fromJsonResource(named: "TitleLabelComponent")
        return labelComponent
    }

    static func headingExample() throws -> LabelComponent {
        let labelComponent: LabelComponent = try fromJsonResource(named: "HeadingLabelComponent")
        return labelComponent
    }

    static func bodyExample() throws -> LabelComponent {
        let labelComponent: LabelComponent = try fromJsonResource(named: "BodyLabelComponent")
        return labelComponent
    }
}
