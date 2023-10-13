//
//  InfoCardButtonComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 13/10/23.
//

import Foundation

public class InfoCardButtonComponent: Component {
    public let button: ButtonComponent

    private enum CodingKeys: String, CodingKey {
        case button
    }

    public init(
        id: String,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        section: String? = nil,
        button: ButtonComponent
    ) {
        self.button = button
        super.init(id: id, margins: margins, type: .infoCardButton, arrangement: arrangement, section: section)
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.button = try container.decode(ButtonComponent.self, forKey: .button)
        try super.init(from: decoder)
    }
}
