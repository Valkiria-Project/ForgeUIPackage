//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class Component: Identifiable, Codable {
    public let id: UUID

    public enum ComponentType: String, Codable {
        case label = "LABEL"
        case textField = "TEXT_FIELD"
        case button = "BUTTON"
    }

    private enum CodingKeys: String, CodingKey {
        case type, margins
    }

    public let type: ComponentType
    let margins: Margin

    init(type: ComponentType, margins: Margin) {
        self.id = UUID()
        self.type = type
        self.margins = margins
    }

    public required init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.type = try keyedContainer.decode(ComponentType.self, forKey: .type)
        self.margins = try keyedContainer.decode(Margin.self, forKey: .margins)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(margins, forKey: .margins)
    }
}
