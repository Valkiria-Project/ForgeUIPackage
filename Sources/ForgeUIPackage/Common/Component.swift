//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class Component: Identifiable, Codable {

    public let id: UUID
    public let identifier: Identifier?
    public let textStyle: TextStyle?
    public let margins: Margin
    public let type: ComponentType
    public let arrangement: Arrangement

    enum CodingKeys: String, CodingKey {
        case margins, id, identifier, type, arrangement
        case textStyle = "text_style"
    }

    init(
        identifier: Identifier? = nil,
        textStyle: TextStyle? = nil,
        margins: Margin,
        type: ComponentType,
        arrangement: Arrangement
    ) {
        self.id = UUID()
        self.identifier = identifier
        self.textStyle = textStyle
        self.margins = margins
        self.type = type
        self.arrangement = arrangement
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.textStyle = try container.decodeIfPresent(TextStyle.self, forKey: .textStyle)
        self.margins = try container.decode(Margin.self, forKey: .margins)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.arrangement = try container.decode(Arrangement.self, forKey: .arrangement)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encode(self.textStyle, forKey: .textStyle)
        try container.encode(self.margins, forKey: .margins)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.arrangement, forKey: .arrangement)
    }
}
