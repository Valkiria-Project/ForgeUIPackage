//
//  ImageButtonSectionComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 15/09/23.
//

import Foundation

public class ImageButtonSectionComponent: Component {
    public let title: Component.Content
    public let options: [ImageButtonComponent]

    private enum CodingKeys: String, CodingKey {
        case title, options
    }

    public init(
        id: String,
        textStyle: Component.TextStyle? = nil,
        margins: Component.Margin,
        type: Component.ComponentType,
        arrangement: Component.Arrangement,
        title: Component.Content,
        options: [ImageButtonComponent]
    ) {
        self.title = title
        self.options = options
        super.init(id: id, margins: margins, type: .imageButtonSection, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.options = try container.decode([ImageButtonComponent].self, forKey: .options)
        try super.init(from: decoder)
    }
}
