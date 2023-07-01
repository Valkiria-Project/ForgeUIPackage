//
//  LabelComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public enum LabelStyle: String, Codable {
    case body = "BODY"
    case title = "TITLE"
    case heading = "HEADING"
}

public class LabelComponent: Component {
    public private(set) var text: String
    public private(set) var style: LabelStyle
    public private(set) var margins: Margin

    private enum CodingKeys: String, CodingKey {
        case text, margins, style
    }

    public init(text: String, style: LabelStyle, margins: Margin) {
        self.text = text
        self.style = style
        self.margins = margins
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.margins = try container.decode(Margin.self, forKey: .margins)
        self.style = try container.decode(LabelStyle.self, forKey: .style)
        super.init()
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
