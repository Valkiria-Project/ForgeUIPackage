//
//  ImageButtonSectionComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 15/09/23.
//

import Foundation

public class ImageButtonSectionComponent: Component {
    public let options: [ImageButtonSectionItem]

    private enum CodingKeys: String, CodingKey {
        case options
    }

    public init(
        id: String,
        margins: Component.Margin,
        arrangement: Component.Arrangement,
        options: [ImageButtonSectionItem]
    ) {
        self.options = options
        super.init(id: id, margins: margins, type: .imageButtonSection, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([ImageButtonSectionItem].self, forKey: .options)
        try super.init(from: decoder)
    }
}

public struct ImageButtonSectionItem: Codable, Identifiable {
    public let id: String
    public let margins: Component.Margin
    public let title: Component.Content
    public let options: [ImageButtonComponent]

    private enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case margins, title, options
    }

    public init(
        id: String,
        margins: Component.Margin,
        title: Component.Content,
        options: [ImageButtonComponent]
    ) {
        self.id = id
        self.margins = margins
        self.title = title
        self.options = options
    }
}
