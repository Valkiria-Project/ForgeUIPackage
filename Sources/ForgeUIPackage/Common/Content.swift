//
//  Content.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 8/08/23.
//

import Foundation

extension Component {
    public struct Content: Codable {
        public let text: String
        public let textStyle: Component.TextStyle

        private enum CodingKeys: String, CodingKey {
            case text
            case textStyle = "text_style"
        }

        public init(text: String, textStyle: Component.TextStyle) {
            self.text = text
            self.textStyle = textStyle
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.text = try container.decode(String.self, forKey: .text)
            self.textStyle = try container.decode(Component.TextStyle.self, forKey: .textStyle)
        }
    }
}


