//
//  File.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/08/23.
//

import Foundation

public struct DetailScreen: Codable {
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
        }

        public init(
            icon: String? = nil,
            title: Text,
            subtitle: Text? = nil,
            margins: Component.Margin
        ) {
            self.icon = icon
            self.title = title
            self.subtitle = subtitle
            self.margins = margins
        }
    }
}
