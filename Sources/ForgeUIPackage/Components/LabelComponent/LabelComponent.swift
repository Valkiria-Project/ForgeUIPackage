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

public struct LabelComponent: Component, Codable {
    public private(set) var text: String
    public private(set) var margins: Margin
    public private(set) var style: LabelStyle

    public init(text: String, style: LabelStyle, margins: Margin) {
        self.text = text
        self.margins = margins
        self.style = style
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.margins = try container.decode(Margin.self, forKey: .margins)
        self.style = try container.decode(LabelStyle.self, forKey: .style)
    }
}

extension LabelComponent {
    static func titleExample() throws -> Self {
        let labelComponent: LabelComponent = try SerializationHelper.fromJsonResource(named: "TitleLabelComponent")
        return labelComponent
    }

    static func headingExample() throws -> Self {
        let labelComponent: LabelComponent = try SerializationHelper.fromJsonResource(named: "HeadingLabelComponent")
        return labelComponent
    }

    static func bodyExample() throws -> Self {
        let labelComponent: LabelComponent = try SerializationHelper.fromJsonResource(named: "BodyLabelComponent")
        return labelComponent
    }
}
