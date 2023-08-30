//
//  Screen.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 3/08/23.
//

import Foundation

public struct Header: Codable {
    public var icon: String? = nil
    public let title: Text
    public var subtitle: Text? = nil
    public var margins: Component.Margin

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

public struct Footer: Codable {
    public var leftButton: ButtonComponent
    public var middleButton: ButtonComponent?
    public var rightButton: ButtonComponent?
    public var direction: Direction

    enum CodingKeys: String, CodingKey {
        case leftButton = "left_button"
        case middleButton = "middle_button"
        case rightButton = "right_button"
        case direction
    }

    public init(
        leftButton: ButtonComponent,
        middleButton: ButtonComponent?,
        rightButton: ButtonComponent?,
        direction: Direction
    ) {
        self.rightButton = rightButton
        self.middleButton = middleButton
        self.leftButton = leftButton
        self.direction = direction
    }
    
    public enum Direction: String, Codable {
        case vertical = "VERTICAL"
        case horizontal = "HORIZONTAL"
    }
}

public struct Screen: Codable {
    public var header: Header?
    public var body: Body
    public var footer: Footer?

    public init(header: Header? = nil, body: Body, footer: Footer? = nil) {
        self.header = header
        self.body = body
        self.footer = footer
    }
}

public struct Body {
    public var components: [Component]

    public init(components: [Component]) {
        self.components = components
    }
}

// MARK: - Codable Body
extension Body: Decodable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.components = []

        while !container.isAtEnd {
            let superDecoder = try container.superDecoder()
            self.components.append(
                try ComponentSerializer(from: superDecoder).component
            )
        }
    }
}

extension Body: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        for component in components {
            let superEncoder = container.superEncoder()
            try ComponentSerializer(component).encode(to: superEncoder)
        }
    }
}
