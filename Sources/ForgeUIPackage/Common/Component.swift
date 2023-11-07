//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class Component: Identifiable, Codable {
    public let id: String
    public let textStyle: TextStyle?
    public let section: String?
    public let margins: Margin
    public let type: ComponentType
    public let arrangement: Arrangement
    public let visibility: Bool?

    enum CodingKeys: String, CodingKey {
        case margins, type, arrangement, section, visibility
        case textStyle = "text_style"
        case id = "identifier"
    }

    init(
        id: String,
        textStyle: TextStyle? = nil,
        margins: Margin,
        type: ComponentType,
        arrangement: Arrangement,
        section: String? = nil,
        visibility: Bool? = nil
    ) {
        self.id = id
        self.textStyle = textStyle
        self.margins = margins
        self.type = type
        self.arrangement = arrangement
        self.section = section
        self.visibility = visibility
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.textStyle = try container.decodeIfPresent(TextStyle.self, forKey: .textStyle)
        self.margins = try container.decode(Margin.self, forKey: .margins)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.arrangement = try container.decode(Arrangement.self, forKey: .arrangement)
        self.section = try container.decodeIfPresent(String.self, forKey: .section)
        self.visibility = try container.decodeIfPresent(Bool.self, forKey: .visibility)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.textStyle, forKey: .textStyle)
        try container.encode(self.margins, forKey: .margins)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.arrangement, forKey: .arrangement)
        try container.encode(self.section, forKey: .section)
        try container.encode(self.visibility, forKey: .visibility)
    }
}
