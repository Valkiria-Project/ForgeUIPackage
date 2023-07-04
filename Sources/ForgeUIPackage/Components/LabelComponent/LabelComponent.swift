//
//  LabelComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class LabelComponent: Component {
    public enum Style: String, Codable {
        case body = "BODY"
        case title = "TITLE"
        case heading = "HEADING"
    }

    public private(set) var text: String
    public private(set) var style: Style

    private enum CodingKeys: String, CodingKey {
        case text, style
    }

    public init(text: String, style: Style, margins: Margin) {
        self.text = text
        self.style = style
        super.init(margins: margins)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.style = try container.decode(Style.self, forKey: .style)
        try super.init(from: decoder)
    }
}

extension LabelComponent {
    static func titleExample() throws -> LabelComponent {
        let labelComponent: LabelComponent = try SerializationHelper.fromJsonResource(named: "TitleLabelComponent")
        return labelComponent
    }

    static func headingExample() throws -> LabelComponent {
        let labelComponent: LabelComponent = try SerializationHelper.fromJsonResource(named: "HeadingLabelComponent")
        return labelComponent
    }

    static func bodyExample() throws -> LabelComponent {
        let labelComponent: LabelComponent = try SerializationHelper.fromJsonResource(named: "BodyLabelComponent")
        return labelComponent
    }
}
