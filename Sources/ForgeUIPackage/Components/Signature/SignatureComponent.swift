//
//  SignatureComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 21/10/23.
//

import Foundation

public class SignatureComponent: Component {
    public let label: Component.Content
    public let button: ButtonComponent

    private enum CodingKeys: String, CodingKey {
        case label = "label"
        case button = "button"
    }

    public init(
        id: String,
        label: Component.Content,
        button: ButtonComponent,
        margins: Component.Margin
    ) {
        self.label = label
        self.button = button
        super.init(id: id, margins: margins, type: .signature, arrangement: .center)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decode(Component.Content.self, forKey: .label)
        self.button = try container.decode(ButtonComponent.self, forKey: .button)
        try super.init(from: decoder)
    }
}
