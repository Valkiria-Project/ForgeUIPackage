//
//  StepperComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 26/09/23.
//

import Foundation

public class StepperComponent: Component {
    public let options: [String: String]

    private enum CodingKeys: String, CodingKey {
        case options
    }

    public init(
        id: String,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        section: String? = nil,
        options: [String: String]
    ) {
        self.options = options
        super.init(id: id, margins: margins, type: .stepper, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: String].self, forKey: .options)
        try super.init(from: decoder)
    }
}
