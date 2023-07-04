//
//  Component.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/06/23.
//

import Foundation

public class Component: Identifiable, Codable {
    public let id: UUID
    public let margins: Margin

    enum CodingKeys: CodingKey {
        case margins, id
    }

    public init(margins: Margin) {
        self.id = UUID()
        self.margins = margins
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.margins = try container.decode(Margin.self, forKey: .margins)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.margins, forKey: .margins)
    }
}
