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
            self.images =  try container.decode([String].self, forKey: .images)
            self.title =  try container.decode(Component.Content.self, forKey: .title)
            self.subtitle = try container.decode(Component.Content.self, forKey: .subtitle)
            self.hour =  try container.decode(Component.Content.self, forKey: .hour)
            try super.init(from: decoder)
        }
    }

    public let header: DetailScreen.Header
    public let details: Body

    public init(header: DetailScreen.Header, details: Body) {
        self.header = header
        self.details = details
    }
}

extension DetailScreen {
    public struct Header: Codable {
        public let icon: String?
        public let title: Text
        public let subtitle: Text?
        public let rightIcon: String?
        public let badgeCount: String?
        public let margins: Component.Margin

        public struct Text: Codable {
            public var text: String
            public var style: Component.TextStyle

            private enum CodingKeys: String, CodingKey {
                case text
                case style = "text_style"
            }

            public init(text: String, style: Component.TextStyle) {
                self.text = text
                self.style = style
            }
        }

        private enum CodingKeys: String, CodingKey {
            case title, subtitle, margins
            case icon = "left_icon"
            case rightIcon = "right_icon"
            case badgeCount = "badge_count"
        }

        public init(
            icon: String? = nil,
            title: Text,
            subtitle: Text? = nil,
            rightIcon: String? = nil,
            badgeCount: String? = nil,
            margins: Component.Margin
        ) {
            self.icon = icon
            self.title = title
            self.subtitle = subtitle
            self.rightIcon = rightIcon
            self.badgeCount = badgeCount
            self.margins = margins
        }
    }
}
