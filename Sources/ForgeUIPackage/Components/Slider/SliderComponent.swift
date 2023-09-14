//
//  SliderComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 13/09/23.
//

import Foundation

public class SliderComponent: Component {
    public let selected: Int
    public let min: Int
    public let max: Int

    private enum CodingKeys: String, CodingKey {
        case selected, min, max
    }

    public init(
        id: String,
        margins: Component.Margin,
        type: Component.ComponentType,
        arrangement: Component.Arrangement,
        selected: Int,
        min: Int,
        max: Int
    ) {
        self.selected = selected
        self.min = min
        self.max = max
        super.init(id: id, margins: margins, type: .slider, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.selected = try container.decode(Int.self, forKey: .selected)
        self.min = try container.decode(Int.self, forKey: .min)
        self.max = try container.decode(Int.self, forKey: .max)
        try super.init(from: decoder)
    }
}
