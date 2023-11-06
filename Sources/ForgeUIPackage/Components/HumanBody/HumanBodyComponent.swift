//
//  File.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 24/09/23.
//

import Foundation

public class HumanBodyComponent: Component {
    public let header: Header
    public let wounds: [String]
    public let burningLevel: [String]

    private enum CodingKeys: String, CodingKey {
        case header, wounds
        case burningLevel = "burning_level"
    }

    public init(
        id: String,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        section: String? = nil,
        header: Header,
        wounds: [String],
        burningLevel: [String]
    ) {
        self.header = header
        self.wounds = wounds
        self.burningLevel = burningLevel
        super.init(
            id: id,
            margins: margins,
            type: .infoCardButton,
            arrangement: arrangement,
            section: section
        )
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.header = try container.decode(Header.self, forKey: .header)
        self.wounds = try container.decode([String].self, forKey: .wounds)
        self.burningLevel = try container.decode([String].self, forKey: .burningLevel)
        try super.init(from: decoder)
    }
}
