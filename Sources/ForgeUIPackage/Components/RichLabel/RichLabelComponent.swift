//
//  RichLabelComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 10/07/23.
//

import Foundation

public class RichLabelComponent: Component {
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
        super.init(margins: margins, type: .richLabel)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.style = try container.decode(Style.self, forKey: .style)
        try super.init(from: decoder)
    }
}
