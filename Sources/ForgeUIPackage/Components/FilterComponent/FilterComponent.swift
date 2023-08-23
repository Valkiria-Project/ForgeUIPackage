//
//  FilterComponent.swift
//  
//
//  Created by Ricardo Grajales Duque on 21/08/23.
//

import Foundation

public class FilterComponent: Component {
    public private(set) var options: [String]

    private enum CodingKeys: String, CodingKey {
        case options
    }

    public init(
        id: String,
        options: [String],
        textStyle: Component.TextStyle,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.options = options
        super.init(id: id, textStyle: textStyle, margins: margins, type: .label, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String].self, forKey: .options)
        try super.init(from: decoder)
    }
}
