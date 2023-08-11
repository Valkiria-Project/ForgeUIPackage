//
//  File.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/08/23.
//

import Foundation

public struct DetailScreen: Codable {

    public class ReportDetail: Component {
        public let images: [String]
        public let title: Component.Content
        public let subtitle: Component.Content
        public let hour: Component.Content

        private enum CodingKeys: String, CodingKey {
            case images, title, subtitle, hour
        }

        public init(
            identifier: Component.Identifier?,
            images: [String],
            title: Component.Content,
            subtitle: Component.Content,
            hour: Component.Content,
            margins: Component.Margin
        ) {
            self.images = images
            self.title = title
            self.subtitle = subtitle
            self.hour = hour
            super.init(identifier: identifier, margins: margins, type: .reportDetail)
        }

        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.images =  try container.decode([String].self, forKey: .images)
            self.title =  try container.decode(Component.Content.self, forKey: .title)
            self.subtitle = try container.decode(Component.Content.self, forKey: .subtitle)
            self.hour =  try container.decode(Component.Content.self, forKey: .hour)
            try super.init(from: decoder)
        }
    }

    public let header: Header
    public let details: Body

    public init(header: Header, details: Body) {
        self.header = header
        self.details = details
    }
}
