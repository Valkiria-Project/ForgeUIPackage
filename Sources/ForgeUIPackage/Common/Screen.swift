//
//  Screen.swift
//  
//
//  Created by Diego Alejandro Villa Cardenas on 3/08/23.
//

import Foundation

public class Header: Component {
    public let icon: String?
    public let title: Component.Content
    public let subtitle: Component.Content?
    public let rightIcon: String?
    public let badgeCount: String?
    public let detail: DetailScreen?

    private enum CodingKeys: String, CodingKey {
        case title, subtitle
        case icon = "left_icon"
        case rightIcon = "right_icon"
        case badgeCount = "badge_count"
        case detail = "reports_detail"
    }

    public init(
        id: String,
        icon: String? = nil,
        title: Component.Content,
        subtitle: Component.Content? = nil,
        rightIcon: String? = nil,
        badgeCount: String? = nil,
        detail: DetailScreen? = nil,
        margins: Component.Margin,
        arrangement: Component.Arrangement
    ) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.rightIcon = rightIcon
        self.badgeCount = badgeCount
        self.detail = detail
        super.init(id: id, margins: margins, type: .header, arrangement: arrangement)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.title = try container.decode(Component.Content.self, forKey: .title)
        self.subtitle = try container.decodeIfPresent(Component.Content.self, forKey: .subtitle)
        self.rightIcon = try container.decodeIfPresent(String.self, forKey: .rightIcon)
        self.badgeCount = try container.decodeIfPresent(String.self, forKey: .badgeCount)
        self.detail = try container.decodeIfPresent(DetailScreen.self, forKey: .detail)
        try super.init(from: decoder)
    }
}

public struct Footer: Codable {
    public var leftButton: ButtonComponent
    public var rightButton: ButtonComponent?
    public var direction: Direction

    enum CodingKeys: String, CodingKey {
        case leftButton = "left_button"
        case rightButton = "right_button"
        case direction
    }

    public init(
        leftButton: ButtonComponent,
        rightButton: ButtonComponent?,
        direction: Direction
    ) {
        self.rightButton = rightButton
        self.leftButton = leftButton
        self.direction = direction
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.leftButton = try container.decode(ButtonComponent.self, forKey: .leftButton)
        self.rightButton = try container.decodeIfPresent(ButtonComponent.self, forKey: .rightButton)
//        let direction = try container.decodeIfPresent(Direction.self, forKey: .direction)
        self.direction = .horizontal
    }
    
    public enum Direction: String, Codable {
        case horizontal = "HORIZONTAL"
        case vertical = "VERTICAL"
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
