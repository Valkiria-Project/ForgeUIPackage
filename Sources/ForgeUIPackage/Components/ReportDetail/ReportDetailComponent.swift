//
//  ReportDetailComponent.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 11/09/23.
//

import Foundation

public class ReportDetailComponent: Component {
    public let images: [String]
    public let title: Component.Content
    public let subtitle: Component.Content
    public let hour: Component.Content

    private enum CodingKeys: String, CodingKey {
        case images, title, subtitle, hour
    }

    public init(
        id: String,
        images: [String],
        title: Component.Content,
        subtitle: Component.Content,
        hour: Component.Content,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.images = images
        self.title = title
        self.subtitle = subtitle
        self.hour = hour
        super.init(id: id, margins: margins, type: .reportDetail, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.images = try container.decode([String].self, forKey: .images)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.subtitle = try container.decode(Component.Content.self, forKey: .subtitle)
        self.hour = try container.decode(Component.Content.self, forKey: .hour)
        try super.init(from: decoder)
    }
}
