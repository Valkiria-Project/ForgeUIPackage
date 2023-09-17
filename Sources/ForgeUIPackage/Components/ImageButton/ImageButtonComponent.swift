//
//  ImageButtonComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 15/09/23.
//

import Foundation

public class ImageButtonComponent: Component {

    public let image: String
    public let title: Component.Content?
    public let selected: Bool?

    private enum CodingKeys: String, CodingKey {
        case image, title, selected
    }

    public init(
        id: String,
        textStyle: Component.TextStyle? = nil,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        image: String,
        title: Component.Content?,
        selected: Bool?
    ) {
        self.image = image
        self.title = title
        self.selected = selected
        super.init(id: id, margins: margins, type: .imageButton, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decode(String.self, forKey: .image)
        self.title = try container.decodeIfPresent(Component.Content.self, forKey: .title)
        self.selected = try container.decodeIfPresent(Bool.self, forKey: .selected)
        try super.init(from: decoder)
    }
}
